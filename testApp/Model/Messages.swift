//
//  Messages.swift
//  testApp
//
//  Created by Dev on 5/26/20.
//  Copyright © 2020 Dev. All rights reserved.
//

import Foundation
import CoreData

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
    
    func fetchLatestMessages()-> [Message]? {
        
        var latestMessages = [Message]()
        guard let matchUsers = CoreDataManager.shared.fetchMatchUsers() else { return nil }
        let context = persintentContainer.viewContext
        
        for matchUser in matchUsers {
            let fetchRequest = NSFetchRequest<Message>(entityName: "Message")
           fetchRequest.sortDescriptors = [NSSortDescriptor(key: "date", ascending: false)]
            fetchRequest.predicate = NSPredicate(format: "user.name = %@", matchUser.name!)
           fetchRequest.fetchLimit = 1
                   
           do {
               let message = try context.fetch(fetchRequest)
                latestMessages.append(contentsOf: message)
           } catch let fetchError{
                print("Failed to fetch: \(fetchError)")
                return nil
           }
        }
       
        return latestMessages.sorted(by: { $0.date?.compare($1.date!) == .orderedDescending })
    }
}
