//
//  FilterViewController.swift
//  RedBus
//
//  Created by Anirudh Das on 8/22/18.
//  Copyright © 2018 Aniruddha Das. All rights reserved.
//

import UIKit

class FilterViewController: BaseViewController {

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
    @IBOutlet weak var applyBtn: UIButton!
    
    var sortBy: SortBusesBy = .none
    var busFilterType = BusType(isAc: false, isNonAc: false, isSeater: false, isSleeper: false)
    var handlerOnDismiss: ((SortBusesBy, BusType) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addShadowAndCornerRadius()
        addSortButtonsStack()
        addFilterButtonsStack()
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
        addSortButtonsStack()
    }
    
    @IBAction func departureAction(_ sender: UIButton) {
        if sortBy == .departureTimeAscending {
            sortBy = .departureTimeDescending
        } else if sortBy == .departureTimeDescending {
            sortBy = .none
        } else {
            sortBy = .departureTimeAscending
        }
        addSortButtonsStack()
    }
    
    @IBAction func fareAction(_ sender: UIButton) {
        if sortBy == .fareAscending {
            sortBy = .fareDescending
        } else if sortBy == .fareDescending {
            sortBy = .none
        } else {
            sortBy = .fareAscending
        }
        addSortButtonsStack()
    }
    
    @IBAction func acAction(_ sender: UIButton) {
        if busFilterType.isAc {
            busFilterType.isAc = false
        } else {
            busFilterType.isAc = true
        }
        addFilterButtonsStack()
    }
    
    @IBAction func noAcAction(_ sender: UIButton) {
        if busFilterType.isNonAc {
            busFilterType.isNonAc = false
        } else {
            busFilterType.isNonAc = true
        }
        addFilterButtonsStack()
    }
    
    @IBAction func seaterAction(_ sender: UIButton) {
        if busFilterType.isSeater {
            busFilterType.isSeater = false
        } else {
            busFilterType.isSeater = true
        }
        addFilterButtonsStack()
    }
    
    @IBAction func sleeperAction(_ sender: UIButton) {
        if busFilterType.isSleeper {
            busFilterType.isSleeper = false
        } else {
            busFilterType.isSleeper = true
        }
        addFilterButtonsStack()
    }
    
    func addShadowAndCornerRadius() {
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
        applyBtn.layer.cornerRadius = radius
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.7)
    }
    
    func resetSortButtonUI() {
        ratingImg.image = Constants.ratingDeselected
        ratingArrow.isHidden = true
        departureImg.image = Constants.depatureDeselected
        departureArrowIng.isHidden = true
        fareImg.image = Constants.fareDeselected
        fareArrowImg.isHidden = true
    }
    
    func addSortButtonsStack() {
        resetSortButtonUI()
        switch sortBy {
            case .ratingAscending:
                ratingImg.image = Constants.ratingSelected
                ratingArrow.isHidden = false
                ratingArrow.image = Constants.arrowUp
            case .ratingDescending:
                ratingImg.image = Constants.ratingSelected
                ratingArrow.isHidden = false
                ratingArrow.image = Constants.arrowDown
            case .departureTimeAscending:
                departureImg.image = Constants.depatureSelected
                departureArrowIng.isHidden = false
                departureArrowIng.image = Constants.arrowUp
            case .departureTimeDescending:
                departureImg.image = Constants.depatureSelected
                departureArrowIng.isHidden = false
                departureArrowIng.image = Constants.arrowDown
            case .fareAscending:
                fareImg.image = Constants.fareSelected
                fareArrowImg.isHidden = false
                fareArrowImg.image = Constants.arrowUp
            case .fareDescending:
                fareImg.image = Constants.fareSelected
                fareArrowImg.isHidden = false
                fareArrowImg.image = Constants.arrowDown
            case .none:
                break
        }
    }
    
    func resetFilterButtonUI() {
        acImg.image = Constants.acDeselected
        nonAcImg.image = Constants.nonACDeselected
        seaterImg.image = Constants.seaterDeselected
        sleeperImg.image = Constants.sleeperDeselected
    }
    
    func addFilterButtonsStack() {
        if busFilterType.isAc {
            acImg.image = Constants.acSelected
        } else {
            acImg.image = Constants.acDeselected
        }
        
        if busFilterType.isNonAc {
            nonAcImg.image = Constants.nonACSelected
        } else {
            nonAcImg.image = Constants.nonACDeselected
        }
        
        if busFilterType.isSeater {
            seaterImg.image = Constants.seaterSelected
        } else {
            seaterImg.image = Constants.seaterDeselected
        }
        
        if busFilterType.isSleeper {
            sleeperImg.image = Constants.sleeperSelected
        } else {
            sleeperImg.image = Constants.sleeperDeselected
        }
    }
}
