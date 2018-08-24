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
    
    func configureNavBar() {
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.lightNavyColor(), NSAttributedStringKey.font: UIFont.systemFont(ofSize: 18.0, weight: .semibold)]
        navigationController?.navigationBar.tintColor = UIColor.lightNavyColor()
    }
}
