//
//  SampleViewModel.swift
//  Pryaniky.com
//
//  Created by Akmaral on 3/7/21.
//
import Foundation

final class SampleViewModel: NSObject {
  
    var reloadTableViewClosure: (()->()) = {}
    var listDataResult: SampleModel? {
        didSet {
            self.reloadTableViewClosure()
        }
    }
    var networkManager: NetworkManager

    init(networkManager: NetworkManager = NetworkManager()) {
        self.networkManager = networkManager
        super.init()
        loadDataResults()
     }
    
    func loadDataResults() {
        networkManager.fetchDataResults { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .success(let sampleModel):
                strongSelf.listDataResult = sampleModel
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }

    
}

