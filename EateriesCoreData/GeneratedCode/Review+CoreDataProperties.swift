//
//  Review+CoreDataProperties.swift
//  EateriesCoreData
//
//  Created by Nguyen Chanh Tin on 5/28/21.
//
//

import Foundation
import CoreData


extension Review {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Review> {
        return NSFetchRequest<Review>(entityName: "Review")
    }

    @NSManaged public var author: String?
    @NSManaged public var comment: String?
    @NSManaged public var eatery: Eatery?

}

extension Review : Identifiable {

}
