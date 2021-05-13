//
//  Eatery+CoreDataProperties.swift
//  Eateries
//
//  Created by Nguyen Chanh Tin on 5/13/21.
//
//

import Foundation
import CoreData


extension Eatery {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Eatery> {
        return NSFetchRequest<Eatery>(entityName: "Eatery")
    }

    @NSManaged public var notes: String?
    @NSManaged public var image: String?
    @NSManaged public var name: String?
    @NSManaged public var location: String?
    @NSManaged public var review: NSOrderedSet?
    @NSManaged public var eateryModel: EateryModel?

}

// MARK: Generated accessors for review
extension Eatery {

    @objc(insertObject:inReviewAtIndex:)
    @NSManaged public func insertIntoReview(_ value: Review, at idx: Int)

    @objc(removeObjectFromReviewAtIndex:)
    @NSManaged public func removeFromReview(at idx: Int)

    @objc(insertReview:atIndexes:)
    @NSManaged public func insertIntoReview(_ values: [Review], at indexes: NSIndexSet)

    @objc(removeReviewAtIndexes:)
    @NSManaged public func removeFromReview(at indexes: NSIndexSet)

    @objc(replaceObjectInReviewAtIndex:withObject:)
    @NSManaged public func replaceReview(at idx: Int, with value: Review)

    @objc(replaceReviewAtIndexes:withReview:)
    @NSManaged public func replaceReview(at indexes: NSIndexSet, with values: [Review])

    @objc(addReviewObject:)
    @NSManaged public func addToReview(_ value: Review)

    @objc(removeReviewObject:)
    @NSManaged public func removeFromReview(_ value: Review)

    @objc(addReview:)
    @NSManaged public func addToReview(_ values: NSOrderedSet)

    @objc(removeReview:)
    @NSManaged public func removeFromReview(_ values: NSOrderedSet)

}

extension Eatery : Identifiable {

}
