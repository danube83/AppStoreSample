//
//  HairlineConstant.swift
//  SampleProject
//
//  Created by danube83 on 2017. 2. 1..
//  Copyright © 2017년 danube83. All rights reserved.
//

import UIKit

@IBDesignable
extension NSLayoutConstraint {
    @IBInspectable var hairLineConstraint: Int {
        get {
            return Int(self.constant * UIScreen.main.scale)
        }
        set {
            self.constant = CGFloat(integerLiteral: newValue) / UIScreen.main.scale
        }
    }
}
