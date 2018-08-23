//
//  BaseViewController.swift
//  RedBus
//
//  Created by Anirudh Das on 8/22/18.
//  Copyright © 2018 Aniruddha Das. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configureNavBar() {
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.redBusRed, NSAttributedStringKey.font: UIFont.systemFont(ofSize: 20.0, weight: .bold)]
        //navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = UIColor.redBusRed
    }
}
