//
//  StringExtension.swift
//  SampleProject
//
//  Created by danube83 on 2017. 2. 1..
//  Copyright © 2017년 danube83. All rights reserved.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
