//
//  DetailImageSlideTableViewCell2.swift
//  SampleProject
//
//  Created by danube83 on 2017. 2. 6..
//  Copyright © 2017년 danube83. All rights reserved.
//

import UIKit

class DetailImageSlideTableViewCell: UITableViewCell {

    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageStackView: UIStackView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        scrollView.contentInset = UIEdgeInsetsMake(0, 10, 0, 10)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension DetailImageSlideTableViewCell: ApplicationDetailProtocolForInteractor {
    func prepare(by data: ApplicationDetailModel?) {
        guard
            let screenshots = data?.screenshots,
            screenshots.count > 0
        else {
            indicator.startAnimating()
            return
        }
        
        indicator.stopAnimating()
        for screenshot in screenshots {
            imageStackView.addArrangedSubview(screenshot)
        }
        
    }
}

extension DetailImageSlideTableViewCell: ReusableView {
    
}

extension DetailImageSlideTableViewCell: NibLoadableView {
    
}
