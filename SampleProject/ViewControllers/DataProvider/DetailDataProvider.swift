//
//  DetailDataProvider.swift
//  SampleProject
//
//  Created by danube83 on 2017. 2. 6..
//  Copyright © 2017년 danube83. All rights reserved.
//

import Foundation
import SDWebImage

class DetailDataProvider {
    var applicationDetail: ApplicationDetailModel?
    
    
    func loadDetailData(with applicationID: String, completion: @escaping ()->()) {
        let api = applicationDetailAPI(with: applicationID)
        send(api: api, keyPath: "results") { [weak self] (response: ApplicationDetailModel?) in
            
            defer {
                completion()
            }
            
            guard let unwrrapedResponse = response else {
                return
            }
            
            self?.applicationDetail = unwrrapedResponse
        }

    }
    
    func loadScreenshots(completion: @escaping () -> ()) {
        guard let screenshotUrls = applicationDetail?.screenshotUrls else {
            completion()
            return
        }

        var itemCount = 0
        for screenshotURL in screenshotUrls {
            SDWebImageManager.shared().loadImage(with: URL(string: screenshotURL), options: [], progress: nil, completed: { [weak self] (image, data, error, cacheType, isSuccess, url) in
                
                itemCount += 1
                if isSuccess, let image = image {
                    
                    let imageView = UIImageView(image: image.deviceScaleImage().borderedImage(color: UIColor.lightGray, width: 1))
                    self?.applicationDetail?.screenshots.append(imageView)
                    if itemCount == screenshotUrls.count {
                        completion()
                    }
                }
                
                
            })
            
        }
    }

}
