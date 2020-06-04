//
//  CoreDataManager.swift
//  testApp
//
//  Created by Dev on 5/25/20.
//  Copyright © 2020 Dev. All rights reserved.
//
import Foundation
import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    let persintentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error {
                fatalError("Loading of store failed \(error)")
            }
        }
        return container
    }()
    
}



