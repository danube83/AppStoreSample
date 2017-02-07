//
//  PresentProtocols.swift
//  SampleProject
//
//  Created by danube83 on 2017. 2. 6..
//  Copyright © 2017년 danube83. All rights reserved.
//

import UIKit

protocol TableViewPresenteralbe {
    var tableView: UITableView? {get}
    func countOfItem() -> Int
    func cell(at indexPath: IndexPath, of tableView: UITableView) -> UITableViewCell
}

protocol TableViewCellSelectable {
    func didSelect(at indexPath: IndexPath)
}
