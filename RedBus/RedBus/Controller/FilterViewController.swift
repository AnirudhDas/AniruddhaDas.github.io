//
//  FilterViewController.swift
//  RedBus
//
//  Created by Anirudh Das on 8/22/18.
//  Copyright © 2018 Aniruddha Das. All rights reserved.
//

import UIKit

protocol SortFilterResultsDelegate {
    func applySortFilters(sort: String, filter: String)
}

class FilterViewController: UIViewController {

    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var btnApply: UIButton!
    
    var sortFilterDelegate: SortFilterResultsDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnCancel?.addTarget(self, action: #selector(btnCancelTapped), for: .touchUpInside)
        btnApply?.addTarget(self, action: #selector(btnApplyTapped), for: .touchUpInside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func btnCancelTapped() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func btnApplyTapped() {
        if let sortFilterDelegate = sortFilterDelegate {
            sortFilterDelegate.applySortFilters(sort: "Asc", filter: "AC")
        }
        self.dismiss(animated: true, completion: nil)
    }
}
