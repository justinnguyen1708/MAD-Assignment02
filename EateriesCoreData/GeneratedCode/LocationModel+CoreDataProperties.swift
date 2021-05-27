//
//  LocationModel+CoreDataProperties.swift
//  EateriesCoreData
//
//  Created by Nguyen Chanh Tin on 5/27/21.
//
//

import Foundation
import CoreData


extension LocationModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LocationModel> {
        return NSFetchRequest<LocationModel>(entityName: "LocationModel")
    }

    @NSManaged public var latitudeSpan: Float
    @NSManaged public var longitudeSpan: Float
    @NSManaged public var location: Location?

}

extension LocationModel : Identifiable {

}
