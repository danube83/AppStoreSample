//
//  Constants.swift
//  SampleProject
//
//  Created by danube83 on 2017. 1. 31..
//  Copyright © 2017년 danube83. All rights reserved.
//

import UIKit

struct ApiPaths {
    static let topFreeApplications = "/%@/rss/topfreeapplications/limit=50/genre=%d/json"
    static let applicationDetail = "/lookup"
}

struct ScreenSize {
    static let width = UIScreen.main.bounds.width
    static let height = UIScreen.main.bounds.height
}
