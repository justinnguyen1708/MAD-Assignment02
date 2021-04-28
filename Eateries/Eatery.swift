//
//  Eatery.swift
//  Eateries
//
//  Created by Nguyen Chanh Tin on 4/22/21.
//

import Foundation
import SwiftUI

/// Eatery model class
class Eatery: ObservableObject, Identifiable, Decodable, Encodable {
    @Published var image: String
    @Published var name: String
    @Published var location: String
    @Published var notes: String
    @Published var reviews: [[String]]
    
    /// Eatery initialisation
    /// - Parameters:
    ///   - image: URL of image
    ///   - name: eatery name
    ///   - location: eatery location
    ///   - notes: notes of the eatery
    ///   - reviews: reviews of the eatery
    init (image: String, name: String, location: String, notes: String, reviews: [[String]]) {
        self.image = image
        self.name = name
        self.location = location
        self.notes = notes
        self.reviews = reviews
    }
    
    /// Add new review
    func addNewReview () {
        let newReview = [String(), String()]
        self.reviews.append(newReview)
    }
    
    
    /// Remove specific review from the list of reviews
    /// - Parameter indices: indices with specific index to be removed at
    func removeReview (at indices: IndexSet) {
        self.reviews.remove(atOffsets: indices)
    }
    
    /// Move review to specific index
    /// - Parameters:
    ///   - indices: indices with specific index to be moved from
    ///   - destination: destination index
    func moveReview (from indices: IndexSet, to destination: Int) {
        self.reviews.move(fromOffsets: indices, toOffset: destination)
    }
    
    /// Download image from the internet using URL
    /// - Parameter eateryURL: URL to eatery image
    /// - Returns: downloaded image
    func downloadEateryImage (foodURL: String) -> Image {
        let emptyImage = Image("blank")
        
        // Check input URL -> assign to imageURL
        guard let imageURL = URL(string: foodURL) else {
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
    
    enum CodingKeys: String, CodingKey, RawRepresentable {
        case image
        case name
        case location
        case notes
        case reviews
    }
    
    /// JSON decoder
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        image = try container.decode(String.self, forKey: .image)
        name = try container.decode(String.self, forKey: .name)
        location = try container.decode(String.self, forKey: .location)
        notes = try container.decode(String.self, forKey: .notes)
        reviews = try container.decode([[String]].self, forKey: .reviews)
    }
    
    // JSON encoder
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(image, forKey: .image)
        try container.encode(name, forKey: .name)
        try container.encode(location, forKey: .location)
        try container.encode(notes, forKey: .notes)
        try container.encode(reviews, forKey: .reviews)
    }
}
