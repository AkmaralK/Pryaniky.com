//
//  APIService.swift
//  Pryaniky.com
//
//  Created by Akmaral on 3/7/21.
//
import Foundation
import Moya

enum APIService {
    case getData
}

extension APIService: TargetType {

    var baseURL: URL {
        return URL(string: "https://pryaniky.com/static/json")!
        
    }
    var path: String {
        switch self {
        case .getData:
            return "/sample.json"
        }
    }
    var method: Moya.Method {
        return .get
    }
    var parameters: [String: Any]? {
        return nil
    }
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
    var sampleData: Data {
        return Data()
    }
    var task: Task {
        return .requestPlain
    }
    var headers: [String : String]? {
        return nil
    }
}
