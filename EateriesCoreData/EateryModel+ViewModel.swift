//
//  EateryModel+ViewModel.swift
//  EateriesCoreData
//
//  Created by Nguyen Chanh Tin on 5/13/21.
//

import Foundation
import CoreData

extension EateryModel {
    /// Non-optional ViewModel name property
    var nameString: String {
        get { name ?? "" }
        set { name = newValue }
    }
    
    /// ViewModel computed property that returns eateries as Array
    var eateriesArray: [Eatery] {
        get {eateries?.array as? [Eatery] ?? []}
        set {eateries? = NSOrderedSet(array: newValue)}
    }
    
    var viewContext: NSManagedObjectContext {
        managedObjectContext ?? NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    }
    
    /// Add a new eatery to eateries
    func addEatery() {
        let newEatery = Eatery(context: viewContext)
        newEatery.image = "blank"
        newEatery.name = "<NEW>"
        newEatery.notes = "some notes here"
        newEatery.location = Location(context: viewContext)
        addToEateries(newEatery)

        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    /// Delete a eatery from eateries
    func deleteEatery(offsets: IndexSet) {
        offsets.map { eateriesArray[$0] }.forEach(viewContext.delete)

        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    /// Move eatery to specific index
    /// - Parameters:
    ///   - indices: indices with specific index to be moved from
    ///   - destination: destination index
    func moveEatery (from indices: IndexSet, to destination: Int) {
        eateriesArray.move(fromOffsets: indices, toOffset: destination)
        
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
