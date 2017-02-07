//
//  DetailDescTableViewCell.swift
//  SampleProject
//
//  Created by danube83 on 2017. 2. 3..
//  Copyright © 2017년 danube83. All rights reserved.
//

import UIKit

class DetailDescTableViewCell: UITableViewCell {
    @IBOutlet weak var descriptionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension DetailDescTableViewCell: ApplicationDetailProtocolForInteractor {
    func prepare(by data: ApplicationDetailModel?) {
        guard let data = data else {
            return
        }

        descriptionLabel.text = data.descriptionText
    }
}

extension DetailDescTableViewCell: ReusableView {
    
}

extension DetailDescTableViewCell: NibLoadableView {
    
}
