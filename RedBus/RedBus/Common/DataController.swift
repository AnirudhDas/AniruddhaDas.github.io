//
//  DataController.swift
//  RedBus
//
//  Created by Anirudh Das on 8/22/18.
//  Copyright © 2018 Aniruddha Das. All rights reserved.
//

import Foundation
import Foundation
import CoreData

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
                fatalError(error!.localizedDescription)
            }
            self.autoSaveViewContext()
            self.configureContexts()
            completion?()
        }
    }
}

// MARK:- Autosaving

extension DataController {
    func saveContext() {
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func autoSaveViewContext(interval:TimeInterval = 30) {
        print("Autosaving")
        
        guard interval > 0 else {
            print("Cannot set negative autosave interval")
            return
        }
        
        if viewContext.hasChanges {
            try? viewContext.save()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + interval) {
            self.autoSaveViewContext(interval: interval)
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
        object.isAC = bus.isAC
        object.isNONAC = bus.isNONAC
        object.isSEATER = bus.isSEATER
        object.isSLEEPER = bus.isSLEEPER
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
            var buses = (try viewContext.fetch(Bus.fetchRequest()) as? [Bus])!
            buses.sort(by: { $0.departureTime < $1.departureTime })
            return buses
        } catch {
            return []
        }
    }
}
