//
//  HomeViewController.swift
//  SampleProject
//
//  Created by danube83 on 2017. 1. 31..
//  Copyright © 2017년 danube83. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

fileprivate let estimatedRowDefaultHeight: CGFloat = 67.0

class HomeViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    fileprivate var selectedRow = -1
    fileprivate var topFreeApplications = [TopFreeApplicationModel]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        title = "Finance Top 50".localized
        
        tableView.estimatedRowHeight = estimatedRowDefaultHeight;
        tableView.register(TopFreeApplicationTableViewCell.self)
        
        
        let api = topFreeApplicationAPI()
        send(api: api, keyPath: "feed.entry") { [unowned self] (response: [TopFreeApplicationModel]?) in
            guard let unwrappedResponse = response else {
                return
            }
            self.topFreeApplications = unwrappedResponse
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension HomeViewController: UITableViewDataSource {
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topFreeApplications.count;
    }
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(for: indexPath) as TopFreeApplicationTableViewCell
        if let topFreeApplication = topFreeApplications[safeIndex: indexPath.row] {
            cell.prepare(with: topFreeApplication, rank: indexPath.row + 1)
        }
        return cell
    }
    
}

extension HomeViewController: UITableViewDelegate {
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectedRow = indexPath.row
        self.performSegue(withIdentifier: "showDetail", sender: self)
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
            
            if let applicationID = topFreeApplications[safeIndex: selectedRow]?.identifier {
                destination.applicationID = applicationID
            }
            
        default:
            return
        }
    }
}


