//
//  EateryModel+CoreDataProperties.swift
//  EateriesCoreData
//
//  Created by Nguyen Chanh Tin on 5/27/21.
//
//

import Foundation
import CoreData


extension EateryModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<EateryModel> {
        return NSFetchRequest<EateryModel>(entityName: "EateryModel")
    }

    @NSManaged public var name: String?
    @NSManaged public var eateries: NSOrderedSet?

}

// MARK: Generated accessors for eateries
extension EateryModel {

    @objc(insertObject:inEateriesAtIndex:)
    @NSManaged public func insertIntoEateries(_ value: Eatery, at idx: Int)

    @objc(removeObjectFromEateriesAtIndex:)
    @NSManaged public func removeFromEateries(at idx: Int)

    @objc(insertEateries:atIndexes:)
    @NSManaged public func insertIntoEateries(_ values: [Eatery], at indexes: NSIndexSet)

    @objc(removeEateriesAtIndexes:)
    @NSManaged public func removeFromEateries(at indexes: NSIndexSet)

    @objc(replaceObjectInEateriesAtIndex:withObject:)
    @NSManaged public func replaceEateries(at idx: Int, with value: Eatery)

    @objc(replaceEateriesAtIndexes:withEateries:)
    @NSManaged public func replaceEateries(at indexes: NSIndexSet, with values: [Eatery])

    @objc(addEateriesObject:)
    @NSManaged public func addToEateries(_ value: Eatery)

    @objc(removeEateriesObject:)
    @NSManaged public func removeFromEateries(_ value: Eatery)

    @objc(addEateries:)
    @NSManaged public func addToEateries(_ values: NSOrderedSet)

    @objc(removeEateries:)
    @NSManaged public func removeFromEateries(_ values: NSOrderedSet)

}

extension EateryModel : Identifiable {

}
