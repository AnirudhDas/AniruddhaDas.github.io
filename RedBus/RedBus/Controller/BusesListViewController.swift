//
//  BusesListViewController.swift
//  RedBus
//
//  Created by Anirudh Das on 8/22/18.
//  Copyright © 2018 Aniruddha Das. All rights reserved.
//

import UIKit
import SwiftSpinner

class BusesListViewController: UIViewController {

    @IBOutlet weak var tblViewBusesList: UITableView!
    
    var dataController = appDelegate.dataController
    var fetchBusesService: FetchBusesProtocol!
    
    var busesList: [BusDetail] = [] {
        didSet {
            tblViewBusesList.reloadData()
        }
    }
    
    var pickupLocation: String!
    var dropoffLocation: String!
    var journeyDate: String!
    
    func setupWith(pickupLocation: String, dropoffLocation: String, journeyDate: String, fetchBusesService: FetchBusesProtocol) {
        self.pickupLocation = pickupLocation
        self.dropoffLocation = dropoffLocation
        self.journeyDate = journeyDate
        self.fetchBusesService = fetchBusesService
    }
    
    func setupNavBar() {
        let filterBtn = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(BusesListViewController.filterBtnClicked))
        self.navigationItem.rightBarButtonItem = filterBtn
    }
    
    @objc func filterBtnClicked() {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let filterViewController = storyboard.instantiateViewController(withIdentifier: "filterVC") as? FilterViewController else {
            return
        }
        filterViewController.sortFilterDelegate = self
        filterViewController.modalPresentationStyle = .overCurrentContext
        present(filterViewController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        tblViewBusesList.delegate = self
        tblViewBusesList.dataSource = self
        fetchBuses()
    }
    
    @objc func fetchBuses() {
        SwiftSpinner.show("Please wait... Fetching Buses")
        fetchBusesService.fetchAllBuses { [weak self] (busesList) in
            SwiftSpinner.hide()
            guard let weakSelf = self, let busesList = busesList else {
                return
            }
            weakSelf.busesList = busesList
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension BusesListViewController: SortFilterResultsDelegate {
    func applySortFilters(sort: String, filter: String) {
        let AC_Buses_Set: Set<BusDetail> = Set(busesList.filter ({ $0.isAC == true }))
        let NON_AC_Buses_Set: Set<BusDetail> = Set(busesList.filter ({ $0.isNONAC == true }))
        let SEATER_Buses_Set: Set<BusDetail> = Set(busesList.filter ({ $0.isSEATER == true }))
        let SLEEPER_Buses_Set: Set<BusDetail> = Set(busesList.filter ({ $0.isSLEEPER == true }))

        let unionSet: Set<BusDetail> = AC_Buses_Set.union(SLEEPER_Buses_Set)
        let filteredBusList: [BusDetail] = Array(unionSet)
        let sortedBusList = filteredBusList.sorted(by: { $0.departureTime < $1.departureTime })
        
        /*
        let departureTimeSortDescriptor = NSSortDescriptor(key: "departureTime", ascending: true)
        let ratingTimeSortDescriptor = NSSortDescriptor(key: "rating", ascending: true)
        let fareTimeSortDescriptor = NSSortDescriptor(key: "fare", ascending: true)
        
        guard let sortedBusList = (filteredBusList as NSArray).sortedArray(using: [departureTimeSortDescriptor, ratingTimeSortDescriptor, fareTimeSortDescriptor]) as? [BusDetail] else {
            return
        }
        */
        
        busesList = sortedBusList
    }
}

extension BusesListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return busesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let busCell = tableView.dequeueReusableCell(withIdentifier: "busCell", for: indexPath) as? BusTableViewCell else {
            return UITableViewCell()
        }
        busCell.selectionStyle = .none
        busCell.configureCell(busDetail: busesList[indexPath.row])
        return busCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let busCell = tableView.cellForRow(at: indexPath) as? BusTableViewCell, let busDetail = busCell.busDetail else {
            return
        }
        
        _ = Utility.showAlertMessage(title: "Confirm Booking", message: "Are you sure you want to book at \(busDetail.operatorName)?", viewController: self, okButtonTitle: "Book", okHandler: { [weak self] _ in
            guard let weakSelf = self else { return }
            //Go to Edit Account Screen
            weakSelf.dataController.addBus(bus: busDetail)
        }, cancelButtonTitle: "Dismiss", cancelHandler: nil)
        
        //tableView.deselectRow(at: indexPath, animated: true)
    }
}
