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

    @NSManaged public var name: String?
    @NSManaged public var longitude: Double
    @NSManaged public var latitude: Double
    @NSManaged public var eatery: Eatery?
    @NSManaged public var locationModel: LocationModel?

}

extension Location : Identifiable {

}
