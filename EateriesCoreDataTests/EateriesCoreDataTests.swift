//
//  EateriesCoreDataTests.swift
//  EateriesCoreDataTests
//
//  Created by Nguyen Chanh Tin on 5/11/21.
//

import XCTest
import SwiftUI

@testable import EateriesCoreData

class EateriesCoreDataTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    /// Test downloading image using invalid image
    func testDownloadEateryImageInvalid() throws {
        // Eatery object for testing
        let eateryToTest = Eatery()
        
        // URL for testing
        let urlToTest = "abc"
        
        // Name of blank image
        let blank = "blank"
        
        // Download image using invalid url
        let image = eateryToTest.downloadEateryImage(eateryURL: urlToTest)
        
        // Check whether food image is set to blank due to invalid url
        XCTAssertEqual(image, Image(blank))
    }
    
    /// Test downloading image using valid image
    func testDownloadEateryImageValid() throws {
        // Eatery object for testing
        let eateryToTest = Eatery()
        
        // URL for testing
        let urlToTest = "https://www.visitbrisbane.com.au/~/media/choose/convention-bureau/news/boomboomroomrefurb_20201209_wide.ashx"
        
        // Name of blank image
        let blank = "blank"
        
        // Download image using invalid url
        let image = eateryToTest.downloadEateryImage(eateryURL: urlToTest)
        
        // Check whether food image is set to blank due to invalid url
        XCTAssertNotEqual(image, Image(blank))
    }

}
