//
//  Eatery+ViewModel.swift
//  EateriesCoreData
//
//  Created by Nguyen Chanh Tin on 5/13/21.
//

import Foundation
import CoreData
import SwiftUI

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
    
    /// ViewModel computed property that returns reviews as Object
    var locationObject: Location {
        get {location ?? Location(context: viewContext)}
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
        newReview.author = "Reviewer"
        newReview.comment = "Comment"
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
    
    /// Move review to specific index
    /// - Parameters:
    ///   - indices: indices with specific index to be moved from
    ///   - destination: destination index
    func moveReview (from indices: IndexSet, to destination: Int) {
        reviewsArray.move(fromOffsets: indices, toOffset: destination)
        
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    /// Download image from the internet using URL
    /// - Parameter eateryURL: URL to eatery image
    /// - Returns: downloaded image
    func downloadEateryImage (eateryURL: String) -> Image {
        let emptyImage = Image("blank")
        
        // Check input URL -> assign to imageURL
        guard let imageURL = URL(string: eateryURL) else {
            return emptyImage // Invalid URL
        }
        
        // Download image -> assign to imageData
        guard let imageData = try? Data(contentsOf: imageURL) else {
            return emptyImage // Could not download the image
        }
        
        // Get image from the downloaded data -> assign to uiImage
        guard let uiImage = UIImage(data: imageData) else {
            return emptyImage // Downloaded data do not contain an image
        }
        
        // Return image to display on views
        return Image(uiImage: uiImage)
    }
}
