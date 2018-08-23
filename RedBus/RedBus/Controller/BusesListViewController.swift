//
//  BusesListViewController.swift
//  RedBus
//
//  Created by Anirudh Das on 8/22/18.
//  Copyright © 2018 Aniruddha Das. All rights reserved.
//

import UIKit

class BusesListViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    @IBOutlet weak var errorView: UIView!
    
    var dataController = appDelegate.dataController
    var fetchBusesService: FetchBusesProtocol = FetchBusesService()
    
    var busesList: BusesList = BusesList() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        tableView.delegate = self
        tableView.dataSource = self
        fetchBuses()
    }
    
    func setupNavBar() {
        let filterBarButton = UIBarButtonItem(image: Constants.filter, style: .done, target: self, action: #selector(self.presentFilterVC))
        self.navigationItem.rightBarButtonItem = filterBarButton
    }
    
    @objc func presentFilterVC() {
        guard let filterVC = storyboard?.instantiateViewController(withIdentifier: Constants.filterVCStoryboardId) as? FilterViewController, !busesList.filteredBuses.isEmpty else {
            return
        }
        filterVC.modalPresentationStyle = .overCurrentContext
        filterVC.sortBy = busesList.sortBy
        if let bFType = busesList.busType {
            filterVC.busFilterType = bFType
        }
        filterVC.handlerOnDismiss = { (sortBy, busFilterType) in
            self.busesList.sortBy = sortBy
            self.busesList.busType = busFilterType
            self.tableView.reloadData()
        }
        self.present(filterVC, animated: true, completion: nil)
    }
    
    @IBAction func tryAgainAction(_ sender: Any) {
        self.errorView.isHidden = true
        self.tableView.isHidden = false
        fetchBuses()
    }
    
    func fetchBuses() {
        loader.startAnimating()
        performOperationInBackground {
            self.fetchBusesService.fetchAllBuses { [weak self] (busesList) in
                guard let weakSelf = self else { return }
                performUIUpdatesOnMain {
                    weakSelf.loader.stopAnimating()
                    guard let busesList = busesList else {
                        weakSelf.errorView.isHidden = false
                        weakSelf.tableView.isHidden = true
                        return
                    }
                    weakSelf.busesList.allBuses = busesList
                    weakSelf.tableView.reloadData()
                }
            }
        }
    }
}

extension BusesListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return busesList.filteredBuses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let busCell = tableView.dequeueReusableCell(withIdentifier: Constants.busCell, for: indexPath) as? BusTableViewCell else {
            return UITableViewCell()
        }
        busCell.selectionStyle = .none
        busCell.configureCell(busDetail: busesList.filteredBuses[indexPath.row])
        return busCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let busCell = tableView.cellForRow(at: indexPath) as? BusTableViewCell, let busDetail = busCell.busDetail else {
            return
        }
        
        _ = Utility.showAlertMessage(title: Constants.bookingAlertTitle, message: Constants.bookingAlertMessage + " with \(busCell.busDetail.operatorName)?", viewController: self, okButtonTitle: Constants.bookingAlertOK, okHandler: { [weak self] _ in
            guard let weakSelf = self else { return }
            weakSelf.dataController.addBus(bus: busDetail)
        }, cancelButtonTitle: Constants.bookingAlertCancel, cancelHandler: nil)
    }
}
