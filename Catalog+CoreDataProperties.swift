//
//  Catalog+CoreDataProperties.swift
//  MyCoreData
//
//  Created by Jeremy Coots on 11/30/15.
//  Copyright © 2015 Rock Valley College. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Catalog {

    @NSManaged var game: String?
    @NSManaged var console: String?
    @NSManaged var location: String?
    @NSManaged var lender: String?
    @NSManaged var dateGiven: String?

}
