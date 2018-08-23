//
//  DataController.swift
//  RedBus
//
//  Created by Anirudh Das on 8/22/18.
//  Copyright © 2018 Aniruddha Das. All rights reserved.
//

import Foundation
import CoreData

// MARK:- Creates and setups up CoreData Stack.

class DataController {
    let persistentContainer:NSPersistentContainer
    
    var viewContext:NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    let backgroundContext:NSManagedObjectContext!
    
    init(modelName:String) {
        persistentContainer = NSPersistentContainer(name: modelName)
        
        backgroundContext = persistentContainer.newBackgroundContext()
    }
    
    func configureContexts() {
        viewContext.automaticallyMergesChangesFromParent = true
        backgroundContext.automaticallyMergesChangesFromParent = true
        
        backgroundContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        viewContext.mergePolicy = NSMergePolicy.mergeByPropertyStoreTrump
    }
    
    func load(completion: (() -> Void)? = nil) {
        persistentContainer.loadPersistentStores { storeDescription, error in
            guard error == nil else {
                fatalError()
            }
            self.autoSaveViewContext()
            self.configureContexts()
            completion?()
        }
    }
}

// MARK:- Save Context

extension DataController {
    //Manually Save Context
    func saveContext() {
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch let error {
                fatalError(error.localizedDescription)
            }
        }
    }
    
    //Automatically save context
    func autoSaveViewContext(intervalInSeconds: Int = 30) {
        print("Autosaving")
        guard intervalInSeconds > 0 else {
            fatalError("Cannot set negative autosave interval")
        }
        
        if viewContext.hasChanges {
            try? viewContext.save()
        }
        
        performOperationOnMainAfterDelay(delayTimeInSeconds: intervalInSeconds) {
            self.autoSaveViewContext(intervalInSeconds: intervalInSeconds)
        }
    }
}

// MARK:- CRUD Operations

extension DataController {
    func addBus(bus: BusDetail) {
        let object: Bus = Bus(context: viewContext)
        object.source = bus.source
        object.destination = bus.destination
        object.departureTime = bus.departureTime
        object.arrivalTime = bus.arrivalTime
        object.operatorName = bus.operatorName
        object.rating = bus.rating
        object.busLogoURL = bus.busLogoURL
        object.isAC = bus.busType.isAc
        object.isNONAC = bus.busType.isNonAc
        object.isSEATER = bus.busType.isSeater
        object.isSLEEPER = bus.busType.isSleeper
        object.fare = bus.fare
        object.currency = bus.currency
        saveContext()
    }
    
    func deleteBooking(bus: Bus) {
        viewContext.delete(bus)
        saveContext()
    }
    
    func updateBooking(bus: Bus, rating: Double) {
        bus.rating = rating
        saveContext()
    }
    
    func getBookings() -> [Bus] {
        do {
            guard var buses = try viewContext.fetch(Bus.fetchRequest()) as? [Bus] else {
                return []
            }
            //Sort to get the latest ride first
            buses.sort(by: { $0.departureTime < $1.departureTime })
            return buses
        } catch {
            return []
        }
    }
}
