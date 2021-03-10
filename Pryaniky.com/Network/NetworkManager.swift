//
//  NetworkManager.swift
//  Pryaniky.com
//
//  Created by Akmaral on 3/7/21.
//

import Moya

protocol Networkable {
    var provider: MoyaProvider<APIService> { get }

    func fetchDataResults(completion: @escaping (Result<SampleModel, Error>) -> ())
    
   
}

final class NetworkManager: NSObject, Networkable {
    var provider = MoyaProvider<APIService>(plugins: [NetworkLoggerPlugin()])

    func fetchDataResults(completion: @escaping (Result<SampleModel, Error>) -> ()) {
        request(target: .getData, completion: completion)
        
    }
    
}
    

private extension NetworkManager {
    private func request<T: Decodable>(target: APIService, completion: @escaping (Result<T, Error>) -> ()) {
        provider.request(target) { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(T.self, from: response.data)
                    completion(.success(results))
                } catch let error {
                    completion(.failure(error))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }

}

