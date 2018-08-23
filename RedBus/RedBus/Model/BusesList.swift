//
//  BusesList.swift
//  RedBus
//
//  Created by Anirudh Das on 8/22/18.
//  Copyright © 2018 Aniruddha Das. All rights reserved.
//

import Foundation

enum SortBusesBy {
    case ratingAscending
    case ratingDescending
    case departureTimeAscending
    case departureTimeDescending
    case fareAscending
    case fareDescending
    case none
}

struct BusesList {
    
    var sortBy: SortBusesBy = .none
    var busType: BusType?
    var allBuses: [BusDetail]? = []
    
    var filteredBuses: [BusDetail] {
        if let allBuses = allBuses {
            
            guard let busType = busType else {
                return sortBusList(busList: Array(allBuses))
            }
            
            //No filter set
            if busType.isAc == false && busType.isNonAc == false && busType.isSeater == false && busType.isSleeper == false {
                return sortBusList(busList: Array(allBuses))
            }
            
            //Set Filters
            let acBuses = allBuses.filter({
                busType.isAc && (busType.isAc == $0.busType.isAc)
            })
            
            let nonAcBuses = allBuses.filter({
                busType.isNonAc && (busType.isNonAc == $0.busType.isNonAc)
            })
            
            let seaterBuses = allBuses.filter({
                busType.isSeater && (busType.isSeater == $0.busType.isSeater)
            })
            
            let sleeperBuses = allBuses.filter({
                busType.isSleeper && (busType.isSleeper == $0.busType.isSleeper)
            })
            
            let setOne: Set<BusDetail> = Set(acBuses)
            let setTwo: Set<BusDetail> = Set(nonAcBuses)
            let setThree: Set<BusDetail> = Set(seaterBuses)
            let setFour: Set<BusDetail> = Set(sleeperBuses)
            
            var finalSet = setOne.union(setTwo).union(setThree).union(setFour)
            
            if busType.isAc {
                finalSet = finalSet.intersection(setOne)
            }
            
            if busType.isNonAc {
                finalSet = finalSet.intersection(setTwo)
            }
            
            if busType.isSeater {
                finalSet = finalSet.intersection(setThree)
            }
            
            if busType.isSleeper {
                finalSet = finalSet.intersection(setFour)
            }
            
            let sortedList = sortBusList(busList: Array(finalSet))
            return sortedList
        }
        
        return []
    }
    
    func sortBusList(busList: [BusDetail]) -> [BusDetail] {
        var result: [BusDetail] = []
        
        switch sortBy {
            
            case .ratingAscending:
                result = busList.sorted(by: { (busOne, busTwo) -> Bool in
                    if busOne.rating != -1 && busTwo.rating != -1 {
                        return busOne.rating < busTwo.rating
                    } else {
                        return true
                    }
                })
            
            case .ratingDescending:
                result = busList.sorted(by: { (busOne, busTwo) -> Bool in
                    if busOne.rating != -1 && busTwo.rating != -1 {
                        return busOne.rating > busTwo.rating
                    } else {
                        return true
                    }
                })
            
            case .departureTimeAscending:
                result = busList.sorted(by: { (busOne, busTwo) -> Bool in
                    return busOne.departureTime < busTwo.departureTime
                })
            
            case .departureTimeDescending:
                result = busList.sorted(by: { (busOne, busTwo) -> Bool in
                    return busOne.departureTime > busTwo.departureTime
                })
            
            case .fareAscending:
                result = busList.sorted(by: { (busOne, busTwo) -> Bool in
                    return busOne.fare < busTwo.fare
                })
            
            case .fareDescending:
                result = busList.sorted(by: { (busOne, busTwo) -> Bool in
                    return busOne.fare > busTwo.fare
                })
            
            case .none:
                result = busList
        }
        
        return result
    }
}
