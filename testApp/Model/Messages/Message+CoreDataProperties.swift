//
//  Message+CoreDataProperties.swift
//  testApp
//
//  Created by Dev on 6/2/20.
//  Copyright © 2020 Dev. All rights reserved.
//
//

import Foundation
import CoreData


extension Message {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Message> {
        return NSFetchRequest<Message>(entityName: "Message")
    }

    @NSManaged public var date: Date?
    @NSManaged public var text: String?
    @NSManaged public var isSender: Bool
    @NSManaged public var user: MatchUser?

}
