//
//  DetailInteractor.swift
//  SampleProject
//
//  Created by danube83 on 2017. 2. 6..
//  Copyright © 2017년 danube83. All rights reserved.
//

import UIKit

enum DetailCell: Int {
    case top = 0
    case imageSlide
    case description
    
    var indexPath: IndexPath {
        return IndexPath(row: self.rawValue, section: 0)
    }
    
}

fileprivate func == (lhs: Int, rhs: DetailCell) -> Bool {
    return lhs == rhs.rawValue
}

protocol DetailInteracterDelegate: InteracterDelegate {
    func finishedImageLoad(at indexPath: IndexPath)
}

protocol DetailDataAccessible {
    var countOfItem: Int {get}
}

class DetailInteractor {
    let dataProvider = DetailDataProvider()
    weak var delegate: DetailInteracterDelegate?
    var applicationID: String = ""
}



extension DetailInteractor: DetailDataAccessible {
    var countOfItem: Int {
        var count = 1
        if let screenshotUrls = dataProvider.applicationDetail?.screenshotUrls,
            screenshotUrls.count > 0 {
            count += 1
        }
        
        if (dataProvider.applicationDetail?.description) != nil {
            count += 1
        }
        
        return count
    }
}

extension DetailInteractor: DataLoadable {
    func loadData() {
        dataProvider.loadDetailData(with: applicationID) { [weak self] in
            self?.delegate?.finishedDataLoad()
            self?.dataProvider.loadScreenshots { [weak self] in
                self?.delegate?.finishedImageLoad(at: DetailCell.imageSlide.indexPath)
            }
        }
    }
}

extension DetailInteractor: CellMakable {
    func cell(at indexPath: IndexPath, of tableView: UITableView) -> UITableViewCell {
        
        var cell: UITableViewCell
        if indexPath.row == DetailCell.top {
            cell = tableView.dequeueReusableCell(for: indexPath) as DetailTopTableViewCell
        } else if indexPath.row == DetailCell.imageSlide {
            cell = tableView.dequeueReusableCell(for: indexPath) as DetailImageSlideTableViewCell
        } else {
            cell = tableView.dequeueReusableCell(for: indexPath) as DetailDescTableViewCell
        }
        
        let aCell = cell as? ApplicationDetailProtocolForInteractor
        aCell?.prepare(by: dataProvider.applicationDetail)
        
        return cell
    }
}
