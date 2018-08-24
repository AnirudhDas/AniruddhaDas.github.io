//
//  BusesListViewController.swift
//  RedBus
//
//  Created by Anirudh Das on 8/22/18.
//  Copyright © 2018 Aniruddha Das. All rights reserved.
//

import UIKit

class BusesListViewController: BaseViewController {

    @IBOutlet weak var busListTblView: UITableView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var errorView: UIView!
    @IBOutlet weak var retryBtn: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    var dataController = appDelegate.dataController
    var fetchBusesService: FetchBusesProtocol = FetchBusesService(apiURL: ServerConfiguration.Request.apiFetchBusUrl)
    
    var busesDataSource: BusesList = BusesList() {
        didSet {
            busListTblView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBarWithFilterButton()
        busListTblView.delegate = self
        busListTblView.dataSource = self
        fetchBuses()
    }
    
    func setupNavBarWithFilterButton() {
        let filterBarButton = UIBarButtonItem(image: Constants.filter, style: .done, target: self, action: #selector(self.showFilterVC))
        self.navigationItem.rightBarButtonItem = filterBarButton
    }
    
    @objc func showFilterVC() {
        guard let filterVC = storyboard?.instantiateViewController(withIdentifier: Constants.filterVCStoryboardId) as? FilterViewController, let busesArr = busesDataSource.allBuses, !busesArr.isEmpty else {
            return
        }
        filterVC.modalPresentationStyle = .overFullScreen
        filterVC.sortBy = busesDataSource.sortBy
        if let busType = busesDataSource.busType {
            filterVC.busFilterType = busType
        }
        filterVC.applyCompletionHandler = { (sortBy, busFilterType) in
            self.busesDataSource.sortBy = sortBy
            self.busesDataSource.busType = busFilterType
            self.busListTblView.reloadData()
            if self.busesDataSource.filteredBuses.isEmpty {
                /*
                self.errorView.isHidden = false
                self.busListTblView.isHidden = true
                self.errorLabel.text = Constants.useDifferentFilter
                self.retryBtn.isHidden = true
                */
                self.view.makeToast(Constants.useDifferentFilter, duration: 3.0, position: .bottom)
            } else {
                /*
                self.errorView.isHidden = true
                self.busListTblView.isHidden = false
                self.errorLabel.text = Constants.somethingWentWrong
                self.retryBtn.isHidden = false
                */
                self.view.makeToast(Constants.filterSuccess, duration: 3.0, position: .bottom)
            }
        }
        self.present(filterVC, animated: true, completion: nil)
    }
    
    @IBAction func retryBtnClicked(_ sender: Any) {
        self.errorView.isHidden = true
        self.busListTblView.isHidden = false
        fetchBuses()
    }
    
    func fetchBuses() {
        spinner.startAnimating()
        performOperationInBackground {
            _ = self.fetchBusesService.fetchAllBuses { [weak self] (busesResponse) in
                guard let weakSelf = self else { return }
                performUIUpdatesOnMain {
                    weakSelf.spinner.stopAnimating()
                    guard let busesResponse = busesResponse, !busesResponse.isEmpty else {
                        weakSelf.errorView.isHidden = false
                        //weakSelf.errorLabel.text = Constants.somethingWentWrong
                        weakSelf.busListTblView.isHidden = true
                        return
                    }
                    weakSelf.busesDataSource.allBuses = busesResponse
                    weakSelf.busListTblView.reloadData()
                    weakSelf.view.makeToast(Constants.fetchBusesSuccess, duration: 3.0, position: .bottom)
                }
            }
        }
    }
}

extension BusesListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return busesDataSource.filteredBuses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let busCell = tableView.dequeueReusableCell(withIdentifier: Constants.busCell, for: indexPath) as? BusTableViewCell else {
            return UITableViewCell()
        }
        busCell.selectionStyle = .none
        busCell.configureCell(busDetail: busesDataSource.filteredBuses[indexPath.row])
        return busCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let busCell = tableView.cellForRow(at: indexPath) as? BusTableViewCell, let busDetail = busCell.busDetail else {
            return
        }
        
        _ = Utility.showAlertMessage(title: Constants.bookingAlertTitle, message: Constants.bookingAlertMessage + " with \(busCell.busDetail.operatorName)?", viewController: self, okButtonTitle: Constants.bookingAlertOK, okHandler: { [weak self] _ in
            guard let weakSelf = self else { return }
            weakSelf.dataController.addBooking(bus: busDetail)
            weakSelf.view.makeToast(Constants.bookingSuccessful, duration: 3.0, position: .bottom)
        }, cancelButtonTitle: Constants.bookingAlertCancel, cancelHandler: nil)
    }
}
