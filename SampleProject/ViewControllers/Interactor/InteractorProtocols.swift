//
//  InteractorProtocols.swift
//  SampleProject
//
//  Created by danube83 on 2017. 2. 6..
//  Copyright © 2017년 danube83. All rights reserved.
//

import UIKit

protocol CellInteratorable {
    func cell(at indexPath: IndexPath, of tableView: UITableView ) -> UITableViewCell
}

protocol DataLoadable {
    func loadData()
}

protocol InteracterDelegate: class {
    func finishedDataLoad()
}
