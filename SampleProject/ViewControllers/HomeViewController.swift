//
//  HomeViewController.swift
//  SampleProject
//
//  Created by danube83 on 2017. 1. 31..
//  Copyright © 2017년 danube83. All rights reserved.
//

import UIKit


fileprivate let estimatedRowDefaultHeight: CGFloat = 67.0

class HomeViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let presenter = HomePresenter()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        title = "Finance Top 50".localized
        tableView.estimatedRowHeight = estimatedRowDefaultHeight;
        presenter.viewController = self
        presenter.viewControllerDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension HomeViewController: UITableViewDataSource {
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.countOfItem()
    }
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return presenter.cell(at: indexPath)
    }
    
}

extension HomeViewController: UITableViewDelegate {
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        presenter.didSelect(at: indexPath)
    }
}


//MARK: prepare for segue
extension HomeViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else {
            return
        }
        
        switch identifier {
        case "showDetail":
            guard let destination = segue.destination as? DetailViewController else {
                return
            }
            
            if let applicationID = presenter.applicationID {
                destination.applicationID = applicationID
            }
            
        default:
            return
        }
    }
}


