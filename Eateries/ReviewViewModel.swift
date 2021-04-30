//
//  ReviewViewModel.swift
//  Eateries
//
//  Created by Nguyen Chanh Tin on 5/1/21.
//

import Foundation

/// Review view model
class ReviewViewModel: ObservableObject {
    // List of eateries variable
    @Published var author: String
    
    @Published var review: String
    
    /// EateryViewModel initilisation
    /// - Parameter listOfEateries: list of eateries
    init(author: String, review: String) {
        self.author = author
        self.review = re
    }
}
