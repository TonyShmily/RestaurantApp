//
//  Restaurant+CoreDataProperties.swift
//  RestaurantApp
//
//  Created by 姚鸿 on 16/4/14.
//  Copyright © 2016年 TonyShmily. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Restaurant {

    @NSManaged var name: String
    @NSManaged var type: String
    @NSManaged var location: String
    @NSManaged var image: NSData?
    @NSManaged var rating: String?
    @NSManaged var isVisited: NSNumber

}
