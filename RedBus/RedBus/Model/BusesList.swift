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
            
            //No filter added
            if busType.isAc == false && busType.isNonAc == false && busType.isSeater == false && busType.isSleeper == false {
                return sortBusList(busList: Array(allBuses))
            }
            
            //Set Filters
            let acBuses = allBuses.filter({ busType.isAc && (busType.isAc == $0.busType.isAc) })
            let nonAcBuses = allBuses.filter({ busType.isNonAc && (busType.isNonAc == $0.busType.isNonAc) })
            let seaterBuses = allBuses.filter({ busType.isSeater && (busType.isSeater == $0.busType.isSeater) })
            let sleeperBuses = allBuses.filter({ busType.isSleeper && (busType.isSleeper == $0.busType.isSleeper) })
            
            let setAcBuses: Set<BusDetail> = Set(acBuses)
            let setNonAcBuses: Set<BusDetail> = Set(nonAcBuses)
            let setSeaterBuses: Set<BusDetail> = Set(seaterBuses)
            let setSleeperBuses: Set<BusDetail> = Set(sleeperBuses)
            
            var filteredSet = setAcBuses.union(setNonAcBuses).union(setSeaterBuses).union(setSleeperBuses)
            
            if busType.isAc {
                filteredSet = filteredSet.intersection(setAcBuses)
            }
            
            if busType.isNonAc {
                filteredSet = filteredSet.intersection(setNonAcBuses)
            }
            
            if busType.isSeater {
                filteredSet = filteredSet.intersection(setSeaterBuses)
            }
            
            if busType.isSleeper {
                filteredSet = filteredSet.intersection(setSleeperBuses)
            }
            
            return sortBusList(busList: Array(filteredSet))
        }
        
        return []
    }
    
    func sortBusList(busList: [BusDetail]) -> [BusDetail] {
        var sortedList: [BusDetail] = []
        
        switch sortBy {
            
            case .ratingAscending:
                sortedList = busList.sorted(by: { return ($0.rating != -1 && $1.rating != -1) ? $0.rating < $1.rating : true })
            
            case .ratingDescending:
                sortedList = busList.sorted(by: { return ($0.rating != -1 && $1.rating != -1) ? $0.rating > $1.rating : true })
            
            case .departureTimeAscending:
                sortedList = busList.sorted(by: { return $0.departureTime < $1.departureTime })
            
            case .departureTimeDescending:
                sortedList = busList.sorted(by: { return $0.departureTime > $1.departureTime })
            
            case .fareAscending:
                sortedList = busList.sorted(by: { return $0.fare < $1.fare })
            
            case .fareDescending:
                sortedList = busList.sorted(by: { return $0.fare > $1.fare })
            
            case .none:
                sortedList = busList
        }
        
        return sortedList
    }
}
