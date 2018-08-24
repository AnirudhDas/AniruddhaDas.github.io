//
//  FilterViewController.swift
//  RedBus
//
//  Created by Anirudh Das on 8/22/18.
//  Copyright © 2018 Aniruddha Das. All rights reserved.
//

import UIKit

class FilterViewController: BaseViewController {

    @IBOutlet weak var bgView: UIView!
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
    @IBOutlet weak var resetBtn: UIButton!
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var ratingBtn: UIButton!
    @IBOutlet weak var departureTimeBtn: UIButton!
    @IBOutlet weak var fareBtn: UIButton!
    @IBOutlet weak var acBtn: UIButton!
    @IBOutlet weak var nonAcBtn: UIButton!
    @IBOutlet weak var seaterBtn: UIButton!
    @IBOutlet weak var sleeperBtn: UIButton!
    @IBOutlet weak var applyBtn: UIButton!
    
    var sortBy: SortBusesBy = .none
    var busFilterType = BusType(isAc: false, isNonAc: false, isSeater: false, isSleeper: false)
    var applyCompletionHandler: ((SortBusesBy, BusType) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        configureSortRadioButtonImage(isReset: false)
        configureFilterCheckBoxImage(isReset: false)
    }
    
    func setupView() {
        bgView.addShadow()
        resetBtn.addShadow()
        cancelBtn.addShadow()
        ratingBtn.addShadow()
        departureTimeBtn.addShadow()
        fareBtn.addShadow()
        acBtn.addShadow()
        nonAcBtn.addShadow()
        seaterBtn.addShadow()
        sleeperBtn.addShadow()
        applyBtn.addShadow()
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.7)
    }
    
    @IBAction func resetBtnClicked(_ sender: UIButton) {
        sortBy = .none
        busFilterType = BusType(isAc: false, isNonAc: false, isSeater: false, isSleeper: false)
        configureSortRadioButtonImage(isReset: true)
        configureFilterCheckBoxImage(isReset: true)
    }
    
    @IBAction func applyBtnClicked(_ sender: UIButton) {
        self.dismiss(animated: true, completion: {
            self.applyCompletionHandler?(self.sortBy, self.busFilterType)
        })
    }
    
    @IBAction func cancelBtnClicked(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func ratingBtnClicked(_ sender: UIButton) {
        if sortBy == .ratingDescending {
            sortBy = .ratingAscending
        } else if sortBy == .ratingAscending {
            sortBy = .none
        } else {
            sortBy = .ratingDescending
        }
        configureSortRadioButtonImage(isReset: false)
    }
    
    @IBAction func departureTimeBtnClicked(_ sender: UIButton) {
        if sortBy == .departureTimeAscending {
            sortBy = .departureTimeDescending
        } else if sortBy == .departureTimeDescending {
            sortBy = .none
        } else {
            sortBy = .departureTimeAscending
        }
        configureSortRadioButtonImage(isReset: false)
    }
    
    @IBAction func fareBtnClicked(_ sender: UIButton) {
        if sortBy == .fareAscending {
            sortBy = .fareDescending
        } else if sortBy == .fareDescending {
            sortBy = .none
        } else {
            sortBy = .fareAscending
        }
        configureSortRadioButtonImage(isReset: false)
    }
    
    @IBAction func acBtnClicked(_ sender: UIButton) {
        busFilterType.isAc = busFilterType.isAc ? false : true
        configureFilterCheckBoxImage(isReset: false)
    }
    
    @IBAction func nonAcBtnClicked(_ sender: UIButton) {
        busFilterType.isNonAc = busFilterType.isNonAc ? false : true
        configureFilterCheckBoxImage(isReset: false)
    }
    
    @IBAction func seaterBtnClicked(_ sender: UIButton) {
        busFilterType.isSeater = busFilterType.isSeater ? false : true
        configureFilterCheckBoxImage(isReset: false)
    }
    
    @IBAction func sleeperBtnClicked(_ sender: UIButton) {
        busFilterType.isSleeper = busFilterType.isSleeper ? false : true
        configureFilterCheckBoxImage(isReset: false)
    }
    
    func configureSortRadioButtonImage(isReset: Bool) {
        func resetSortRadioButtonImage() {
            ratingImg.image = Constants.ratingDeselected
            ratingArrow.isHidden = true
            departureImg.image = Constants.depatureDeselected
            departureArrowIng.isHidden = true
            fareImg.image = Constants.fareDeselected
            fareArrowImg.isHidden = true
        }
        
        resetSortRadioButtonImage()
        if !isReset {
            switch sortBy {
            case .ratingAscending:
                ratingImg.image = Constants.ratingSelected
                ratingArrow.image = Constants.arrowUp
                ratingArrow.isHidden = false
            case .ratingDescending:
                ratingImg.image = Constants.ratingSelected
                ratingArrow.image = Constants.arrowDown
                ratingArrow.isHidden = false
            case .departureTimeAscending:
                departureImg.image = Constants.depatureSelected
                departureArrowIng.image = Constants.arrowUp
                departureArrowIng.isHidden = false
            case .departureTimeDescending:
                departureImg.image = Constants.depatureSelected
                departureArrowIng.image = Constants.arrowDown
                departureArrowIng.isHidden = false
            case .fareAscending:
                fareImg.image = Constants.fareSelected
                fareArrowImg.image = Constants.arrowUp
                fareArrowImg.isHidden = false
            case .fareDescending:
                fareImg.image = Constants.fareSelected
                fareArrowImg.image = Constants.arrowDown
                fareArrowImg.isHidden = false
            case .none:
                break
            }
        }
    }
    
    func configureFilterCheckBoxImage(isReset: Bool) {
        if isReset {
            acImg.image = Constants.acDeselected
            nonAcImg.image = Constants.nonACDeselected
            seaterImg.image = Constants.seaterDeselected
            sleeperImg.image = Constants.sleeperDeselected
        } else {
            acImg.image = busFilterType.isAc ? Constants.acSelected : Constants.acDeselected
            nonAcImg.image = busFilterType.isNonAc ? Constants.nonACSelected : Constants.nonACDeselected
            seaterImg.image = busFilterType.isSeater ? Constants.seaterSelected : Constants.seaterDeselected
            sleeperImg.image = busFilterType.isSleeper ? Constants.sleeperSelected : Constants.sleeperDeselected
        }
    }
}
