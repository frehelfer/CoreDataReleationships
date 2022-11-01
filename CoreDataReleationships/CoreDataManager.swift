//
//  CoreDataManager.swift
//  CoreDataReleationships
//
//  Created by Frédéric Helfer on 29/10/22.
//

import Foundation
import CoreData

class CoreDataManager {
    
    static let instance = CoreDataManager()
    let container: NSPersistentContainer
    let moc: NSManagedObjectContext
    
    init() {
        container = NSPersistentContainer(name: "CoreDataContainer")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Error loading Core Data. \(error.localizedDescription)")
            }
        }
        moc = container.viewContext
    }
    
    func save() {
        guard moc.hasChanges else { return }
        
        do {
            try moc.save()
            
            print("Saved successfully!")
        } catch let error {
            print("Error saving Core Data. \(error.localizedDescription)")
        }
    }
    
}
