//
//  EateriesTests.swift
//  EateriesTests
//
//  Created by Nguyen Chanh Tin on 4/22/21.
//

import XCTest
import SwiftUI
@testable import Eateries

class EateriesTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // Eatery class functions //
    
    /// Test setting and getting properties of Eatery class
    func testEateryInitialisation() throws {
        // Image for testing
        let imageToTest = "blank"
        
        // Name for testing
        let nameToTest = "Brisbane cafe"
        
        // Location for testing
        let locationToTest = "Brisbane"
        
        // Notes for testing
        let notesToTest = "This is a good cafe!"
        
        // Reviews for testing
        let reviewsToTest = [["A","I like it"], ["B","I do not like it"]]
        
        // Eatery object with testing properties
        let eatery = Eatery(image: imageToTest, name: nameToTest, location: locationToTest, notes: notesToTest, reviews: reviewsToTest)
        
        // Check whther image is equal image of eatery
        XCTAssertEqual(eatery.image, imageToTest)
        
        // Check whther name is equal name of eatery
        XCTAssertEqual(eatery.name, nameToTest)
        
        // Check whther location is equal location of eatery
        XCTAssertEqual(eatery.location, locationToTest)
        
        // Check whther notes is equal notes of eatery
        XCTAssertEqual(eatery.notes, notesToTest)
        
        // Check whther reviews is equal reviews of eatery
        XCTAssertEqual(eatery.reviews, reviewsToTest)
    }
    
    /// Test add a new review to the list of reviews
    func testAddNewReview() throws {
        // Eatery object for testing
        let eateryToTest = Eatery(image: "blank", name: "Brisbane cafe", location: "Brisbane", notes: "This is a good cafe!", reviews: [["A","I like it"], ["B","I do not like it"]])
        
        // Number of reviews before adding a new review
        let numberOfReviews = eateryToTest.reviews.count
        
        // Add a new review to list of of reviews
        eateryToTest.addNewReview()
        
        // Check whether the number of reviews has increased
        XCTAssertEqual(eateryToTest.reviews.count, numberOfReviews + 1)
    }
    
    /// Test delete a review
    func testRemoveReview() throws {
        
    }
    
    /// Test moving review
    func testMoveReview() throws {
        
    }
    
    /// Test downloading image using invalid image
    func testDownloadEateryImageInvalid() throws {
        // Eatery object for testing
        let eateryToTest = Eatery(image: "blank", name: "Brisbane cafe", location: "Brisbane", notes: "This is a good cafe!", reviews: [["A","I like it"], ["B","I do not like it"]])
        
        // URL for testing
        let urlToTest = "abc"
        
        // Name of blank image
        let blank = "blank"
        
        // Download image using invalid url
        let image = eateryToTest.downloadEateryImage(foodURL: urlToTest)
        
        // Check whether food image is set to blank due to invalid url
        XCTAssertEqual(image, Image(blank))
    }
    
    /// Test downloading image using valid image
    func testDownloadEateryImageValid() throws {
        // Eatery object for testing
        let eateryToTest = Eatery(image: "blank", name: "Brisbane cafe", location: "Brisbane", notes: "This is a good cafe!", reviews: [["A","I like it"], ["B","I do not like it"]])
        
        // URL for testing
        let urlToTest = "abc"
        
        // Name of blank image
        let blank = "blank"
        
        // Download image using invalid url
        let image = eateryToTest.downloadEateryImage(foodURL: urlToTest)
        
        // Check whether food image is set to blank due to invalid url
        XCTAssertEqual(image, Image(blank))
    }
    
    // EateryViewModel class functions //
    func testEateryViewModel() throws {
        // Eatery array for testing
        let eateriesToTest = [
            Eatery(image: "blank", name: "Brisbane cafe", location: "Brisbane", notes: "This is a good cafe!", reviews: [["A","I like it"], ["B","I do not like it"]]),
            Eatery(image: "blank", name: "Sydney cafe", location: "Sydney", notes: "This is a good cafe!", reviews: [["A","I like it"], ["B","I do not like it"]]),
            Eatery(image: "blank", name: "Melbourne cafe", location: "Melbourne", notes: "This is a good cafe!", reviews: [["A","I like it"], ["B","I do not like it"]])
        ]
        
        // Assign eateries array to eatery view model
        let modelToTest = EateryViewModel(listOfEateries: eateriesToTest)
        
        // Check whether list of eateries of modelToTest is equal eateriesToTest
        XCTAssertEqual(modelToTest.listOfEateries.count, eateriesToTest.count)
    }
    

}
