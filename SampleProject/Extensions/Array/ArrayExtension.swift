//
//  ArrayExtension.swift
//  SampleProject
//
//  Created by danube83 on 2017. 2. 3..
//  Copyright © 2017년 danube83. All rights reserved.
//

import Foundation

extension Array {
    subscript(safeIndex index: Int) -> Element? {
        return (indices ~= index) ? self[index] : nil
    }
}
