//
//  TopFreeApplicationTableViewCell.swift
//  SampleProject
//
//  Created by danube83 on 2017. 2. 1..
//  Copyright © 2017년 danube83. All rights reserved.
//

import UIKit
import SDWebImage

protocol TopFreeApplicationProtocolForInteractor {
    func prepare(by data: TopFreeApplicationModel, rank: Int)
}

class TopFreeApplicationTableViewCell: UITableViewCell {
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var appIconImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        rankLabel.text = nil
        titleLabel.text = nil
        appIconImageView.image = nil
    }
    
}

extension TopFreeApplicationTableViewCell: TopFreeApplicationProtocolForInteractor {
    func prepare(by data:TopFreeApplicationModel, rank: Int) {
        rankLabel.text = "\(rank)"
        titleLabel.text = data.title
        if let imageURL = data.appIconImageURL {
            self.appIconImageView.sd_setImage(with: URL(string: imageURL))
        }
    }
}

extension TopFreeApplicationTableViewCell: ReusableView {
    
}

extension TopFreeApplicationTableViewCell: NibLoadableView {
    
}
