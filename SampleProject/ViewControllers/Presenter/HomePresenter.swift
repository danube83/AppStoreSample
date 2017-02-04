//
//  HomePresenter.swift
//  SampleProject
//
//  Created by danube83 on 2017. 2. 4..
//  Copyright © 2017년 danube83. All rights reserved.
//

import UIKit

protocol TableViewPresenteralbe {
    var tableView: UITableView? {get}
    func viewControllerDidLoad()
    func countOfItem() -> Int
    func didSelect(at indexPath: IndexPath)
    func cell(at indexPath: IndexPath) -> UITableViewCell
}

class HomePresenter {
    let interactor = HomeInterator()
    weak var viewController: HomeViewController?
    var selectedRow = -1
    var applicationID: String? {
        return interactor.applicationID(of: selectedRow)
    }
}


extension HomePresenter: TableViewPresenteralbe {
    var tableView: UITableView? {
        return viewController?.tableView
    }
    
    func viewControllerDidLoad () {
        tableView?.register(TopFreeApplicationTableViewCell.self)
        interactor.delegate = self;
        interactor.loadData()
    }
    
    func cell(at indexPath: IndexPath) -> UITableViewCell {
        return interactor.cell(at: indexPath, of: tableView!)
    }

    func didSelect(at indexPath: IndexPath) {
        tableView?.deselectRow(at: indexPath, animated: true)
        selectedRow = indexPath.row
        viewController?.performSegue(withIdentifier: "showDetail", sender: self)
    }
    
    func countOfItem() -> Int {
        return interactor.countOfItem
    }
}


extension HomePresenter: InteracterDelegate {
    func finishedDataLoad() {
        tableView?.reloadData()
    }
}
