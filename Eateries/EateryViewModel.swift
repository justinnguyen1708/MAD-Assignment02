//
//  EateryViewModel.swift
//  Eateries
//
//  Created by Nguyen Chanh Tin on 4/22/21.
//

import Foundation

/// Eatery view model
class EateryViewModel: ObservableObject {
    // List of eateries variable
    @Published var listOfEateries: [Eatery]
    
    /// EateryViewModel initilisation
    /// - Parameter listOfEateries: list of eateries
    init(listOfEateries: [Eatery]) {
        self.listOfEateries = listOfEateries
    }
    
    /// Add a new eatery to the list
    func addNewEatery() {
        let newEatery = Eatery(image: "blank", name: "<NEW>", location: "", notes: "", reviews: [["",""]])
        listOfEateries.append(newEatery)
    }
    
    /// Remove specific eatery from the list of reviews
    /// - Parameter indices: indices with specific index to be removed at
    func removeEatery (at indices: IndexSet) {
        self.listOfEateries.remove(atOffsets: indices)
    }
    
    
    /// Move eatery to specific index
    /// - Parameters:
    ///   - indices: indices with specific index to be moved from
    ///   - destination: destination index
    func moveEatery (from indices: IndexSet, to destination: Int) {
        self.listOfEateries.move(fromOffsets: indices, toOffset: destination)
    }
}
