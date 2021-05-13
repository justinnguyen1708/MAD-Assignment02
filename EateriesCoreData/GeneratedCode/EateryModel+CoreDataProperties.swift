//
//  EateryModel+CoreDataProperties.swift
//  Eateries
//
//  Created by Nguyen Chanh Tin on 5/13/21.
//
//

import Foundation
import CoreData


extension EateryModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<EateryModel> {
        return NSFetchRequest<EateryModel>(entityName: "EateryModel")
    }

    @NSManaged public var name: String?
    @NSManaged public var eatery: NSOrderedSet?

}

// MARK: Generated accessors for eatery
extension EateryModel {

    @objc(insertObject:inEateryAtIndex:)
    @NSManaged public func insertIntoEatery(_ value: Eatery, at idx: Int)

    @objc(removeObjectFromEateryAtIndex:)
    @NSManaged public func removeFromEatery(at idx: Int)

    @objc(insertEatery:atIndexes:)
    @NSManaged public func insertIntoEatery(_ values: [Eatery], at indexes: NSIndexSet)

    @objc(removeEateryAtIndexes:)
    @NSManaged public func removeFromEatery(at indexes: NSIndexSet)

    @objc(replaceObjectInEateryAtIndex:withObject:)
    @NSManaged public func replaceEatery(at idx: Int, with value: Eatery)

    @objc(replaceEateryAtIndexes:withEatery:)
    @NSManaged public func replaceEatery(at indexes: NSIndexSet, with values: [Eatery])

    @objc(addEateryObject:)
    @NSManaged public func addToEatery(_ value: Eatery)

    @objc(removeEateryObject:)
    @NSManaged public func removeFromEatery(_ value: Eatery)

    @objc(addEatery:)
    @NSManaged public func addToEatery(_ values: NSOrderedSet)

    @objc(removeEatery:)
    @NSManaged public func removeFromEatery(_ values: NSOrderedSet)

}

extension EateryModel : Identifiable {

}
