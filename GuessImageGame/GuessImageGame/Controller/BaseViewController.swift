import Foundation
import UIKit

/**
 Base View Controller, sets up the NavigationBar and Background
*/
class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        //self.view.backgroundColor = UIColor.white
        self.addBackgroundImageView()
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
    
    func addBackgroundImageView() {
        var bgImage: UIImageView
        let image: UIImage = BACKGROUND
        bgImage = UIImageView(image: image)
        bgImage.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(bgImage)
        self.view.sendSubview(toBack: bgImage)
        addConstraint(aView: bgImage)
    }
    
    func addConstraint(aView: AnyObject) {
        aView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        aView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        aView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        aView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
}
