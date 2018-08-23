//
//  MyBookingsViewController.swift
//  RedBus
//
//  Created by Anirudh Das on 8/22/18.
//  Copyright © 2018 Aniruddha Das. All rights reserved.
//

import UIKit

class MyBookingsViewController: BaseViewController {

    @IBOutlet weak var tblViewBookings: UITableView!
    var alertController: UIAlertController?
    
    var dataController = appDelegate.dataController
    var busesList: [Bus] = [] {
        didSet {
            tblViewBookings.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblViewBookings.delegate = self
        tblViewBookings.dataSource = self
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fetchBuses()
    }
    
    @objc func fetchBuses() {
        busesList = dataController.getBookings()
    }
}

extension MyBookingsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return busesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let bookingCell = tableView.dequeueReusableCell(withIdentifier: Constants.bookingCell, for: indexPath) as? BookingTableViewCell else {
            return UITableViewCell()
        }
        bookingCell.selectionStyle = .none
        bookingCell.configureCell(busDetail: busesList[indexPath.row])
        return bookingCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let bookingCell = tableView.cellForRow(at: indexPath) as? BookingTableViewCell, let bus = bookingCell.bus else {
            return
        }
        showUpdateRatingAlert(bus: bus)
        //tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            _ = Utility.showAlertMessage(title: Constants.cancelAlertTitle, message: Constants.cancelAlertMessage, viewController: self, okButtonTitle: Constants.cancelAlertOK, okHandler: { [weak self] _ in
                guard let weakSelf = self else { return }
                guard let bookingCell = tableView.cellForRow(at: indexPath) as? BookingTableViewCell, let bus = bookingCell.bus else {
                    return
                }
                weakSelf.dataController.deleteBooking(bus: bus)
                weakSelf.fetchBuses()
                }, cancelButtonTitle: Constants.cancelAlertCancel, cancelHandler: { [weak self] _ in
                    guard let weakSelf = self else { return }
                    weakSelf.tblViewBookings.reloadData()
            })
        }
    }
    
    func showUpdateRatingAlert(bus: Bus) {
        let ratingTxtField = { (textField: UITextField) in
            textField.placeholder = Constants.updateAlertPlaceholder
        }
        
        self.alertController = Utility.showAlertMessage(title: Constants.updateAlertTitle, message: Constants.updateAlertMessage, viewController: self, cancelButtonTitle: Constants.updateAlertCancel, textField: ratingTxtField)
        
        let action = UIAlertAction(title: Constants.updateAlertOK, style: UIAlertActionStyle.default, handler: { [weak self] (alertController) -> Void in
            guard let weakSelf = self else { return }
            guard let ratingStr = weakSelf.alertController?.textFields?.first?.text, let rating = Double(ratingStr), rating >= 0 else {
                print("Invalid Rating")
                return
            }
            weakSelf.dataController.updateBooking(bus: bus, rating: rating)
            weakSelf.fetchBuses()
        })
        
        alertController?.addAction(action)
    }
}
