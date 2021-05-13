//
//  Eatery+CoreDataProperties.swift
//  EateriesCoreData
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

    @NSManaged public var image: String?
    @NSManaged public var location: String?
    @NSManaged public var name: String?
    @NSManaged public var notes: String?
    @NSManaged public var eateryModel: EateryModel?
    @NSManaged public var reviews: NSOrderedSet?

}

// MARK: Generated accessors for reviews
extension Eatery {

    @objc(insertObject:inReviewsAtIndex:)
    @NSManaged public func insertIntoReviews(_ value: Review, at idx: Int)

    @objc(removeObjectFromReviewsAtIndex:)
    @NSManaged public func removeFromReviews(at idx: Int)

    @objc(insertReviews:atIndexes:)
    @NSManaged public func insertIntoReviews(_ values: [Review], at indexes: NSIndexSet)

    @objc(removeReviewsAtIndexes:)
    @NSManaged public func removeFromReviews(at indexes: NSIndexSet)

    @objc(replaceObjectInReviewsAtIndex:withObject:)
    @NSManaged public func replaceReviews(at idx: Int, with value: Review)

    @objc(replaceReviewsAtIndexes:withReviews:)
    @NSManaged public func replaceReviews(at indexes: NSIndexSet, with values: [Review])

    @objc(addReviewsObject:)
    @NSManaged public func addToReviews(_ value: Review)

    @objc(removeReviewsObject:)
    @NSManaged public func removeFromReviews(_ value: Review)

    @objc(addReviews:)
    @NSManaged public func addToReviews(_ values: NSOrderedSet)

    @objc(removeReviews:)
    @NSManaged public func removeFromReviews(_ values: NSOrderedSet)

}

extension Eatery : Identifiable {

}
