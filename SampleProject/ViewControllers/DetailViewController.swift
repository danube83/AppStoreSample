//
//  DetailViewController.swift
//  SampleProject
//
//  Created by danube83 on 2017. 1. 31..
//  Copyright © 2017년 danube83. All rights reserved.
//

import UIKit



fileprivate let estimatedRowDefaultHeight: CGFloat = 96.0

class DetailViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var applicationID = ""
    let presenter = DetailPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.estimatedRowHeight = estimatedRowDefaultHeight
    
        presenter.viewController = self
        presenter.viewControllerDidLoad(with: applicationID)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


extension DetailViewController: UITableViewDataSource {
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.countOfItem()
    }
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return presenter.cell(at: indexPath)
    }
}
