//
//  HomeDataProvider.swift
//  SampleProject
//
//  Created by danube83 on 2017. 2. 4..
//  Copyright © 2017년 danube83. All rights reserved.
//

import Foundation

protocol HomeDataProviderDelegate: class {
    func didReceiveData()
}

class HomeDataProvider {
    weak var delegate: HomeDataProviderDelegate?
    
    var topFreeApplications: [TopFreeApplicationModel]? {
        didSet {
            delegate?.didReceiveData()
        }
    }
    
    
    func loadHomeData() {
        let api = topFreeApplicationAPI()
        send(api: api, keyPath: "feed.entry") { [weak self] (response: [TopFreeApplicationModel]?) in
            guard let unwrappedResponse = response else {
                return
            }
            self?.topFreeApplications = unwrappedResponse
        }
    }
}
