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
    //case imageSlide
    case description
}

protocol DetailDataAccessible {
    var countOfItem: Int {get}
}

class DetailInteractor {
    let dataProvider = DetailDataProvider()
    weak var delegate: InteracterDelegate?
    var applicationID: String = ""
    init () {
        self.dataProvider.delegate = self
    }
}

extension DetailInteractor: DetailDataAccessible {
    var countOfItem: Int {
        return 2
    }
}

extension DetailInteractor: DataLoadable {
    func loadData() {
        dataProvider.loadDetailData(with: applicationID)
    }
}

extension DetailInteractor: CellInteratorable {
    func cell(at indexPath: IndexPath, of tableView: UITableView) -> UITableViewCell {
        
        var cell: UITableViewCell
        if indexPath.row == DetailCell.top.rawValue {
            cell = tableView.dequeueReusableCell(for: indexPath) as DetailTopTableViewCell
        } else {
            cell = tableView.dequeueReusableCell(for: indexPath) as DetailDescTableViewCell
        }
        
        let aCell = cell as? ApplicationDetailProtocolForInteractor
        aCell?.prepare(by: dataProvider.applicationDetail)
        
        return cell
    }
}

extension DetailInteractor: DataProviderDelegate {
    func didReceiveData() {
        delegate?.finishedDataLoad()
    }
}
