//
//  Eatery+ViewModel.swift
//  EateriesCoreData
//
//  Created by Nguyen Chanh Tin on 5/13/21.
//

import Foundation
import CoreData

extension Eatery {
    /// Non-optional ViewModel image property
    var imageString: String {
        get {image ?? ""}
        set {image = newValue}
    }
    
    /// Non-optional ViewModel name property
    var nameString: String {
        get {name ?? ""}
        set {name = newValue}
    }
    
    /// Non-optional ViewModel location property
    var locationString: String {
        get {location ?? ""}
        set {location = newValue}
    }
    
    /// Non-optional ViewModel notes property
    var notesString: String {
        get {notes ?? ""}
        set {notes = newValue}
    }
    
    /// ViewModel computed property that returns reviews as Array
    var reviewsArray: [Review] {
        get {reviews?.array as? [Review] ?? []}
        set {reviews = NSOrderedSet(array: newValue)}
    }
    
    var viewContext: NSManagedObjectContext {
        managedObjectContext ?? NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    }
    
    /// Add a new review to reviews
    func addReview() {
        let newReview = Review(context: viewContext)
        newReview.author = ""
        newReview.comment = ""
        addToReviews(newReview)

        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    /// Delete a review from reviews
    func deleteReview(offsets: IndexSet) {
        offsets.map { reviewsArray[$0] }.forEach(viewContext.delete)

        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    
}
