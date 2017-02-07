//
//  Router.swift
//  SampleProject
//
//  Created by danube83 on 2017. 2. 7..
//  Copyright © 2017년 danube83. All rights reserved.
//

import UIKit


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
