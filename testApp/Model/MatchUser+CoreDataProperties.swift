//
//  MatchUser+CoreDataProperties.swift
//  testApp
//
//  Created by Dev on 5/25/20.
//  Copyright © 2020 Dev. All rights reserved.
//
//

import Foundation
import CoreData


extension MatchUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MatchUser> {
        return NSFetchRequest<MatchUser>(entityName: "MatchUser")
    }

    @NSManaged public var name: String?
    @NSManaged public var profileImage: String?
    @NSManaged public var message: NSSet?

}

// MARK: Generated accessors for message
extension MatchUser {

    @objc(addMessageObject:)
    @NSManaged public func addToMessage(_ value: Message)

    @objc(removeMessageObject:)
    @NSManaged public func removeFromMessage(_ value: Message)

    @objc(addMessage:)
    @NSManaged public func addToMessage(_ values: NSSet)

    @objc(removeMessage:)
    @NSManaged public func removeFromMessage(_ values: NSSet)

}
