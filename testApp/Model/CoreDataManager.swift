//
//  CoreDataManager.swift
//  testApp
//
//  Created by Dev on 5/25/20.
//  Copyright © 2020 Dev. All rights reserved.
//

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

//class MatchUserManager: CoreDataManager {
extension CoreDataManager {
    
    func createMatchUser(name: String, profileImage: String)-> MatchUser? {
        let context = persintentContainer.viewContext
        
        let matchUser = NSEntityDescription.insertNewObject(forEntityName: "MatchUser", into: context) as? MatchUser
        matchUser?.name = name
        matchUser?.profileImage = profileImage
        
        do {
            try context.save()
            return matchUser
        } catch let createError {
            print("Failed to create: \(createError)")
        }
        return nil
    }
    
    func fetchMatchUsers()-> [MatchUser]? {
        let context = persintentContainer.viewContext
        let fetchRequest = NSFetchRequest<MatchUser>(entityName: "MatchUser")
        
        do {
            let matchUsers = try context.fetch(fetchRequest)
            return matchUsers
        } catch let fetchError{
            print("Failed to fetch: \(fetchError)")
        }
        return nil
    }
}

extension CoreDataManager {
    func createMessage(text: String, date: Date, user: MatchUser)-> Message? {
        let context = persintentContainer.viewContext
        
        let message = NSEntityDescription.insertNewObject(forEntityName: "Message", into: context) as? Message
        message?.text = text
        message?.date = date
        message?.user = user
        
        do {
            try context.save()
            return message
        } catch let createError {
            print("Failed to create: \(createError)")
        }
        return nil
    }
    
    func fetchMessages()-> [Message]? {
        let context = persintentContainer.viewContext
        let fetchRequest = NSFetchRequest<Message>(entityName: "Message")
        
        do {
            let messages = try context.fetch(fetchRequest)
            return messages
        } catch let fetchError{
            print("Failed to fetch: \(fetchError)")
        }
        return nil
    }
}
