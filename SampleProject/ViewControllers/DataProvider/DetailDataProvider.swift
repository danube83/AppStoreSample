//
//  DetailDataProvider.swift
//  SampleProject
//
//  Created by danube83 on 2017. 2. 6..
//  Copyright © 2017년 danube83. All rights reserved.
//

import Foundation

class DetailDataProvider {
    weak var delegate: DataProviderDelegate?
    
    var applicationDetail: ApplicationDetailModel? {
        didSet {
            delegate?.didReceiveData()
        }
    }
    
    func loadDetailData(with applicationID: String) {
        let api = applicationDetailAPI(with: applicationID)
        send(api: api, keyPath: "results") { [weak self] (response: ApplicationDetailModel?) in
            guard let unwrrapedResponse = response else {
                return
            }
            
            self?.applicationDetail = unwrrapedResponse
        }

    }

}
