//
//  Eatery.swift
//  Eateries
//
//  Created by Nguyen Chanh Tin on 4/22/21.
//

import Foundation

/// Eatery class
class Eatery {
    var image: String
    var name: String
    var location: String
    var notes: String
    var reviews: String
    
    /// Eatery initialisation
    /// - Parameters:
    ///   - image: URL of image
    ///   - name: eatery name
    ///   - location: eatery location
    ///   - notes: notes of the eatery
    ///   - reviews: reviews of the eatery
    init (image: String, name: String, location: String, notes: String, reviews: String) {
        self.image = image
        self.name = name
        self.location = location
        self.notes = notes
        self.reviews = reviews
    }
}
