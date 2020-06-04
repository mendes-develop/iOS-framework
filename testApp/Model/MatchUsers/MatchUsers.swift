//
//  MatchUsers.swift
//  testApp
//
//  Created by Dev on 5/26/20.
//  Copyright © 2020 Dev. All rights reserved.
//

import Foundation
import CoreData

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
    
    func deleteMatchUser(user: MatchUser){
        let context = persintentContainer.viewContext
        context.delete(user)
        
        do {
            try context.save()
        } catch let deleteError{
            print("Failed to delete user: \(deleteError)")
        }
    }
    
    //user already modified
    //TODO - function fetchs user and takes update data as an argument
    func updatemMtchUser(user: MatchUser){
        let context = persintentContainer.viewContext
        do {
            try context.save()
        } catch let deleteError{
            print("Failed to delete user: \(deleteError)")
        }
        
    }
}
