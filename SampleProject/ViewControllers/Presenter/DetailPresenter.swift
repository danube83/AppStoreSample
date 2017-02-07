//
//  DetailPresenter.swift
//  SampleProject
//
//  Created by danube83 on 2017. 2. 6..
//  Copyright © 2017년 danube83. All rights reserved.
//

import UIKit

protocol DetailPresenterable: TableViewPresenteralbe {
    func viewControllerDidLoad(with applicationID: String)
}

class DetailPresenter {
    fileprivate let interactor = DetailInteractor()
    weak var viewController: DetailViewController?
    init() {
        self.interactor.delegate = self
    }
}


extension DetailPresenter: DetailPresenterable {
    var tableView: UITableView? {
        return viewController?.tableView
    }
    
    func viewControllerDidLoad (with applicationID: String) {
        tableView?.register(DetailTopTableViewCell.self)
        tableView?.register(DetailImageSlideTableViewCell.self)
        tableView?.register(DetailDescTableViewCell.self)
        interactor.applicationID = applicationID
        interactor.loadData()
    }
    
    func cell(at indexPath: IndexPath, of tableView: UITableView) -> UITableViewCell {
        return interactor.cell(at: indexPath, of: tableView)
    }
    
    func countOfItem() -> Int {
        return interactor.countOfItem
    }
}


extension DetailPresenter: DetailInteracterDelegate {
    func finishedDataLoad() {
        tableView?.reloadData()
    }
    
    func finishedImageLoad(at indexPath: IndexPath) {
        tableView?.reloadRows(at: [indexPath], with: .none)
    }
}
