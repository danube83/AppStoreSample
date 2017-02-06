//
//  ApplicationDetailModel.swift
//  SampleProject
//
//  Created by danube83 on 2017. 2. 3..
//  Copyright © 2017년 danube83. All rights reserved.
//

import Foundation
import ObjectMapper

protocol ApplicationDetailProtocolForInteractor {
    func prepare(by data: ApplicationDetailModel?)
}

class ApplicationDetailModel: Mappable {
    var artworkUrl100: String?
    var screenshotUrls: [String]?
    var averageUserRatingForCurrentVersion: Double?
    var trackCensoredName: String?
    var userRatingCountForCurrentVersion: Int?
    var description: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        artworkUrl100 <- map["artworkUrl100"]
        screenshotUrls <- map["screenshotUrls"]
        averageUserRatingForCurrentVersion <- map["averageUserRatingForCurrentVersion"]
        trackCensoredName <- map["trackCensoredName"]
        userRatingCountForCurrentVersion <- map["userRatingCountForCurrentVersion"]
        description <- map["description"]
    }
    
}
