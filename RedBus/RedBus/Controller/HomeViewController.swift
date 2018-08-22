//
//  HomeViewController.swift
//  RedBus
//
//  Created by Anirudh Das on 8/22/18.
//  Copyright © 2018 Aniruddha Das. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var btnShowBuses: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnShowBuses.addTarget(self, action: #selector(showBusesTapped), for: .touchUpInside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @objc func showBusesTapped() {
        self.performSegue(withIdentifier: "showBusesSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showBusesSegue", let destinationVC = segue.destination as? BusesListViewController {
            //Inject dependencies
            destinationVC.setupWith(pickupLocation: "Chennai", dropoffLocation: "Bangalore", journeyDate: "30/8/2018", fetchBusesService: FetchBusesService())
        }
    }
}
