//
//  HomeInterator.swift
//  SampleProject
//
//  Created by danube83 on 2017. 2. 4..
//  Copyright © 2017년 danube83. All rights reserved.
//

import UIKit



protocol HomeDataAccessible {
    var countOfItem: Int {get}
    func applicationID(of row: Int)-> String?
}

class HomeInterator {
    let dataProvider = HomeDataProvider()
    weak var delegate: InteracterDelegate?
    init() {
        self.dataProvider.delegate = self
    }
}

extension HomeInterator: HomeDataAccessible {
    internal var countOfItem: Int {
        return dataProvider.topFreeApplications?.count ?? 0
    }
    
    func applicationID(of row: Int)-> String? {
        return dataProvider.topFreeApplications?[safeIndex: row]?.identifier
    }
}

extension HomeInterator: DataLoadable {
    func loadData() {
        dataProvider.loadHomeData()
    }
}

extension HomeInterator: CellInteratorable {
    func cell(at indexPath: IndexPath, of tableView: UITableView ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as TopFreeApplicationTableViewCell
        if let topFreeApplication = dataProvider.topFreeApplications?[safeIndex: indexPath.row] {
            cell.prepare(by: topFreeApplication, rank: indexPath.row + 1)
        }
        return cell
        
    }
}

extension HomeInterator: DataProviderDelegate {
    func didReceiveData() {
        delegate?.finishedDataLoad()
    }
}


