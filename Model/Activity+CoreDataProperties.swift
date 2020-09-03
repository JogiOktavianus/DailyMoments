//
//  Activity+CoreDataProperties.swift
//  DailyMoments
//
//  Created by Jogi Oktavianus on 03/09/20.
//  Copyright © 2020 Jogi Oktavianus. All rights reserved.
//
//

import Foundation
import CoreData


extension Activity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Activity> {
        return NSFetchRequest<Activity>(entityName: "Activity")
    }

    @NSManaged public var title: String?
    @NSManaged public var image: Data?
    @NSManaged public var id: UUID?
    @NSManaged public var desc: String?
    @NSManaged public var date: Date?

}
