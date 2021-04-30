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
    
    /// Eatery initialisation
    /// - Parameters:
    ///   - image: URL of image
    ///   - name: eatery name
    ///   - location: eatery location
    ///   - notes: notes of the eatery
    ///   - reviews: reviews of the eatery
    init (image: String, name: String, location: String, notes: String) {
        self.image = image
        self.name = name
        self.location = location
        self.notes = notes
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
    
    /// JSON coding keys for decoder and encoder
    enum CodingKeys: String, CodingKey, RawRepresentable {
        case image
        case name
        case location
        case notes
    }
    
    /// JSON decoder
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        image = try container.decode(String.self, forKey: .image)
        name = try container.decode(String.self, forKey: .name)
        location = try container.decode(String.self, forKey: .location)
        notes = try container.decode(String.self, forKey: .notes)
    }
    
    /// JSON encoder
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(image, forKey: .image)
        try container.encode(name, forKey: .name)
        try container.encode(location, forKey: .location)
        try container.encode(notes, forKey: .notes)
    }
}
