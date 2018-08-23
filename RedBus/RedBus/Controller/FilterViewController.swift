//
//  FilterViewController.swift
//  RedBus
//
//  Created by Anirudh Das on 8/22/18.
//  Copyright © 2018 Aniruddha Das. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController {

    @IBOutlet weak var alertBgView: UIView!
    @IBOutlet weak var ratingImg: UIImageView!
    @IBOutlet weak var ratingArrow: UIImageView!
    @IBOutlet weak var departureImg: UIImageView!
    @IBOutlet weak var departureArrowIng: UIImageView!
    @IBOutlet weak var fareImg: UIImageView!
    @IBOutlet weak var fareArrowImg: UIImageView!
    @IBOutlet weak var acImg: UIImageView!
    @IBOutlet weak var nonAcImg: UIImageView!
    @IBOutlet weak var seaterImg: UIImageView!
    @IBOutlet weak var sleeperImg: UIImageView!
    
    var sortBy: SortBy = .none
    var busFilterType = BusType(isAc: false, isNonAc: false, isSeater: false, isSleeper: false)
    var handlerOnDismiss: ((SortBy, BusType) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addShadowAndCornerRadiusForBgView()
        addSortButtonUI()
        addFilterButtonUI()
    }
    
    @IBAction func resetAction(_ sender: UIButton) {
        sortBy = .none
        busFilterType = BusType(isAc: false, isNonAc: false, isSeater: false, isSleeper: false)
        resetSortButtonUI()
        resetFilterButtonUI()
    }
    
    @IBAction func applyAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: {
            self.handlerOnDismiss?(self.sortBy, self.busFilterType)
        })
    }
    
    @IBAction func dismissAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func ratingAction(_ sender: UIButton) {
        if sortBy == .ratingDescending {
            sortBy = .ratingAscending
        } else if sortBy == .ratingAscending {
            sortBy = .none
        } else {
            sortBy = .ratingDescending
        }
        addSortButtonUI()
    }
    
    @IBAction func departureAction(_ sender: UIButton) {
        if sortBy == .departureTimeAscending {
            sortBy = .departureTimeDescending
        } else if sortBy == .departureTimeDescending {
            sortBy = .none
        } else {
            sortBy = .departureTimeAscending
        }
        addSortButtonUI()
    }
    
    @IBAction func fareAction(_ sender: UIButton) {
        if sortBy == .fareAscending {
            sortBy = .fareDescending
        } else if sortBy == .fareDescending {
            sortBy = .none
        } else {
            sortBy = .fareAscending
        }
        addSortButtonUI()
    }
    
    @IBAction func acAction(_ sender: UIButton) {
        if busFilterType.isAc {
            busFilterType.isAc = false
        } else {
            busFilterType.isAc = true
        }
        addFilterButtonUI()
    }
    
    @IBAction func noAcAction(_ sender: UIButton) {
        if busFilterType.isNonAc {
            busFilterType.isNonAc = false
        } else {
            busFilterType.isNonAc = true
        }
        addFilterButtonUI()
    }
    
    @IBAction func seaterAction(_ sender: UIButton) {
        if busFilterType.isSeater {
            busFilterType.isSeater = false
        } else {
            busFilterType.isSeater = true
        }
        addFilterButtonUI()
    }
    
    @IBAction func sleeperAction(_ sender: UIButton) {
        if busFilterType.isSleeper {
            busFilterType.isSleeper = false
        } else {
            busFilterType.isSleeper = true
        }
        addFilterButtonUI()
    }
    
    func addShadowAndCornerRadiusForBgView() {
        let color = UIColor.lightGray
        let opacity: Float = 0.3
        let offset = CGSize(width: 0, height: 3.0)
        let radius: CGFloat = 8.0
        alertBgView.layer.cornerRadius = radius
        alertBgView.layer.masksToBounds = false
        alertBgView.layer.shadowColor = color.cgColor
        alertBgView.layer.shadowOpacity = opacity
        alertBgView.layer.shadowOffset = offset
        alertBgView.layer.shadowRadius = radius
    }
    
    func resetSortButtonUI() {
        ratingImg.image = Constants.ratingOff
        ratingArrow.isHidden = true
        departureImg.image = Constants.timeOff
        departureArrowIng.isHidden = true
        fareImg.image = Constants.fareOff
        fareArrowImg.isHidden = true
    }
    
    func addSortButtonUI() {
        resetSortButtonUI()
        switch sortBy {
            case .ratingAscending:
                ratingImg.image = Constants.ratingOn
                ratingArrow.isHidden = false
                ratingArrow.image = Constants.arrowUp
            case .ratingDescending:
                ratingImg.image = Constants.ratingOn
                ratingArrow.isHidden = false
                ratingArrow.image = Constants.arrowDown
            case .departureTimeAscending:
                departureImg.image = Constants.timeOn
                departureArrowIng.isHidden = false
                departureArrowIng.image = Constants.arrowUp
            case .departureTimeDescending:
                departureImg.image = Constants.timeOn
                departureArrowIng.isHidden = false
                departureArrowIng.image = Constants.arrowDown
            case .fareAscending:
                fareImg.image = Constants.fareOn
                fareArrowImg.isHidden = false
                fareArrowImg.image = Constants.arrowUp
            case .fareDescending:
                fareImg.image = Constants.fareOn
                fareArrowImg.isHidden = false
                fareArrowImg.image = Constants.arrowDown
            case .none:
                break
        }
    }
    
    func resetFilterButtonUI() {
        acImg.image = Constants.acOff
        nonAcImg.image = Constants.noAccOff
        seaterImg.image = Constants.seaterOff
        sleeperImg.image = Constants.sleeperOff
    }
    
    func addFilterButtonUI() {
        if busFilterType.isAc {
            acImg.image = Constants.acOn
        } else {
            acImg.image = Constants.acOff
        }
        
        if busFilterType.isNonAc {
            nonAcImg.image = Constants.noAccOn
        } else {
            nonAcImg.image = Constants.noAccOff
        }
        
        if busFilterType.isSeater {
            seaterImg.image = Constants.seaterOn
        } else {
            seaterImg.image = Constants.seaterOff
        }
        
        if busFilterType.isSleeper {
            sleeperImg.image = Constants.sleeperOn
        } else {
            sleeperImg.image = Constants.sleeperOff
        }
    }
}
