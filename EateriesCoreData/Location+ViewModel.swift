//
//  Location+ViewModel.swift
//  EateriesCoreData
//
//  Created by Nguyen Chanh Tin on 5/27/21.
//

import Foundation

extension Location {
    /// Non-optional ViewModel name property
    var nameString: String {
        get { name ?? "" }
        set { name = newValue}
    }
    
    /// Non-optional ViewModel latitude property
    var latitudeString: String {
        get { "\(latitude)"}
        set {
            guard let doubleValue = Double(newValue) else {return}
            latitude = doubleValue
        }
    }
    
    /// Non-optional ViewModel longitude property
    var longitudeString: String {
        get { "\(longitude)"}
        set {
            guard let doubleValue = Double(newValue) else {return}
            longitude = doubleValue
        }
    }
}
