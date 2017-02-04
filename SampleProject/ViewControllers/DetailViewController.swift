//
//  DetailViewController.swift
//  SampleProject
//
//  Created by danube83 on 2017. 1. 31..
//  Copyright © 2017년 danube83. All rights reserved.
//

import UIKit

fileprivate enum DetailCell: Int {
    case top = 0
    //case imageSlide
    case description
}

fileprivate let estimatedRowDefaultHeight: CGFloat = 96.0

class DetailViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var applicationID = ""
    
    fileprivate var applicationDetail: ApplicationDetailModel? {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.estimatedRowHeight = estimatedRowDefaultHeight
        tableView.register(DetailTopTableViewCell.self)
        tableView.register(DetailImageSlideTableViewCell.self)
        tableView.register(DetailDescTableViewCell.self)
        
        requestApplicationDetail()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


//MARK: request data
extension DetailViewController {
    func requestApplicationDetail() {
        
        let api = applicationDetailAPI(with: applicationID)
        send(api: api, keyPath: "results") { [weak self] (response: ApplicationDetailModel?) in
            guard let unwrrapedResponse = response else {
                return
            }
            
            self?.applicationDetail = unwrrapedResponse
        }
 

    }
}


extension DetailViewController: UITableViewDataSource {
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2;
    }
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.row == DetailCell.top.rawValue {
            let cell = tableView.dequeueReusableCell(for: indexPath) as DetailTopTableViewCell
            cell.starRatingView.rating = applicationDetail?.averageUserRatingForCurrentVersion ?? 0.0
            cell.userRatingCountLabel.text = "(\(applicationDetail?.userRatingCountForCurrentVersion ?? 0))"
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(for: indexPath) as DetailDescTableViewCell
            cell.descriptionLabel.text = applicationDetail?.description
            return cell
        }
        

    }
}
