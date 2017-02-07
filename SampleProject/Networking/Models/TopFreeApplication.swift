//
//  TopFreeApplication.swift
//  SampleProject
//
//  Created by danube83 on 2017. 2. 1..
//  Copyright © 2017년 danube83. All rights reserved.
//

import Foundation
import ObjectMapper

protocol TopFreeApplicationProtocolForInteractor: class {
    func prepare(by data: TopFreeApplicationModel, rank: Int)
}

class TopFreeApplicationModel: Mappable {
    var title: String?
    var appIconImageURL: String?
    var identifier: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        title <- map["im:name.label"]
        appIconImageURL <- map["im:image.1.label"]
        identifier <- map["id.attributes.im:id"]
    }
    
    
}

