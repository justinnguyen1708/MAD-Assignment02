//
//  Location+CoreDataProperties.swift
//  EateriesCoreData
//
//  Created by Nguyen Chanh Tin on 5/27/21.
//
//

import Foundation
import CoreData


extension Location {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Location> {
        return NSFetchRequest<Location>(entityName: "Location")
    }

    @NSManaged public var latitude: Double
    @NSManaged public var latitudeSpan: Double
    @NSManaged public var longitude: Double
    @NSManaged public var longitudeSpan: Double
    @NSManaged public var name: String?
    @NSManaged public var eatery: Eatery?

}

extension Location : Identifiable {

}
