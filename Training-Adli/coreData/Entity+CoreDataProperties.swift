//
//  Entity+CoreDataProperties.swift
//  Training-Adli
//
//  Created by Stella Patricia on 11/09/19.
//  Copyright © 2019 Adli Raihan. All rights reserved.
//
//

import Foundation
import CoreData


extension Entity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Entity> {
        return NSFetchRequest<Entity>(entityName: "Entity")
    }

    @NSManaged public var uid: Int32
    @NSManaged public var username: String?
    @NSManaged public var email: String?

}
