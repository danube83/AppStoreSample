//
//  HomeDataProvider.swift
//  SampleProject
//
//  Created by danube83 on 2017. 2. 4..
//  Copyright © 2017년 danube83. All rights reserved.
//

import Foundation

class HomeDataProvider {
    
    var topFreeApplications: [TopFreeApplicationModel]?
    
    func loadHomeData(completion: @escaping ()->()) {
        let api = topFreeApplicationAPI()
        send(api: api, keyPath: "feed.entry") { [weak self] (response: [TopFreeApplicationModel]?) in
            
            defer {
                completion()
            }
            
            guard let unwrappedResponse = response else {
                return
            }
            self?.topFreeApplications = unwrappedResponse
            
            
        }
    }
}
