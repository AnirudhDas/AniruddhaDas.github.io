//
//  BaseViewController.swift
//  WikipediaSearch
//
//  Created by Anirudh Das on 8/12/18.
//  Copyright © 2018 Aniruddha Das. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    var snackbar: TTGSnackbar?
    
    deinit {
        //print("BaseRiderViewController Deinit: \(self)")
        NotificationCenter.default.removeObserver(self, name: NETWORKLOST, object: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        
        //Checks for network on launch of app
        NotificationCenter.default.addObserver(self, selector: #selector(networkDrop), name: NETWORKLOST, object: nil)
        _ = Utility.isNetworkAvailable()
    }
    
    @objc func networkDrop() {
        dismissSnackbar()
        self.showSnackbar(message: Constants.NO_NETWORK_CONNECTIVITY, duration: .long, icon: nil, backgroundColor: snackbarRed(), textColor: .white)
    }
    
    /*
     Configures a snackbar view and defines action to be performed on dismiss.
     */
    func showSnackbar(message: String, duration:TTGSnackbarDuration, icon: UIImage?, backgroundColor: UIColor, textColor: UIColor) {
        if self.snackbar != nil {
        } else {
            self.snackbar = Snackbar.configure(message: message, duration: duration, icon: icon, backgroundColor: backgroundColor, textColor: textColor)
            
            self.snackbar?.dismissBlock = { [weak self] snackbar in
                guard let strongSelf = self else { return }
                strongSelf.snackbar = nil
            }
            
            self.snackbar?.show()
        }
    }
    
    /**
     Dismiss and deallocate memory while view transition
     */
    func dismissSnackbar() {
        //Dismiss and deallocate memory while view transition
        if self.snackbar != nil {
            self.snackbar?.dismiss()
            self.snackbar = nil
        }
    }
    
    func snackbarRed() -> UIColor {
        return UIColor(red:201/255, green:87/255, blue:87/255, alpha:1.00)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setNavigationTitle(title: String) {
        self.title = title
    }
    
    func configureNavigationBar() {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.white
        self.navigationItem.leftBarButtonItem?.tintColor = UIColor.white
        self.navigationController?.navigationBar.tintColor = UIColor.white
    }
}
