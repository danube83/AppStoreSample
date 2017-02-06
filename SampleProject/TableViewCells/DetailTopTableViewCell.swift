//
//  DetailTopTableViewCell.swift
//  SampleProject
//
//  Created by danube83 on 2017. 2. 3..
//  Copyright © 2017년 danube83. All rights reserved.
//

import UIKit
import Cosmos
import SDWebImage

class DetailTopTableViewCell: UITableViewCell {
    @IBOutlet weak var appIconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var userRatingCountLabel: UILabel!
    @IBOutlet weak var starRatingView: CosmosView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

extension DetailTopTableViewCell: ApplicationDetailProtocolForInteractor {
    func prepare(by data: ApplicationDetailModel?) {
        titleLabel.text = data?.trackCensoredName
        starRatingView.rating = data?.averageUserRatingForCurrentVersion ?? 0.0
        userRatingCountLabel.text = "(\(data?.userRatingCountForCurrentVersion ?? 0))"
        if let appIconImageURL = data?.artworkUrl100 {
            appIconImageView.sd_setImage(with: URL(string: appIconImageURL))
        }
        
    }
}


extension DetailTopTableViewCell: ReusableView {
    
}

extension DetailTopTableViewCell: NibLoadableView {
    
}
