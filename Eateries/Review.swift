//
//  ReviewViewModel.swift
//  Eateries
//
//  Created by Nguyen Chanh Tin on 5/1/21.
//

import Foundation

/// Review view model
class Review: ObservableObject, Identifiable, Decodable, Encodable {
    // Review author
    @Published var author: String
    
    // Review content
    @Published var review: String
    
    
    /// Review class initilisation
    /// - Parameters:
    ///   - author: review author
    ///   - review: review content
    init(author: String, review: String) {
        self.author = author
        self.review = review
    }
    
    /// JSON coding keys for decoder and encoder
    enum CodingKeys: String, CodingKey, RawRepresentable {
        case author
        case review
    }
    
    /// JSON decoder
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        author = try container.decode(String.self, forKey: .author)
        review = try container.decode(String.self, forKey: .review)
    }
    
    /// JSON encoder
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(author, forKey: .author)
        try container.encode(review, forKey: .review)
    }
}
