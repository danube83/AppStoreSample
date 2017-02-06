//
//  UIImageExtension.swift
//  SampleProject
//
//  Created by danube83 on 2017. 2. 6..
//  Copyright © 2017년 danube83. All rights reserved.
//

import UIKit

extension UIImage {
    func deviceScaleImage() -> UIImage {
        if let cgImage = cgImage {
            return UIImage(cgImage: cgImage, scale: UIScreen.main.scale, orientation: .up)
        } else {
            return self
        }
    }
    
    func borderedImage(color: UIColor, width: CGFloat) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: CGPoint.zero)
        color.setStroke()
        let path = UIBezierPath(rect: CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height))
        path.lineWidth = width
        path.stroke()
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        if let image = image {
            return image
        } else {
            return self
        }
        
    }
}

