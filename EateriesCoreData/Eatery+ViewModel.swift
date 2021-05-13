//
//  Eatery+ViewModel.swift
//  EateriesCoreData
//
//  Created by Nguyen Chanh Tin on 5/13/21.
//

import Foundation

extension Eatery {
    var imageString: String {
        get {image ?? ""}
        set {image = newValue}
    }
    
    var nameString: String {
        get {name ?? ""}
        set {name = newValue}
    }
    
    var locationString: String {
        get {location ?? ""}
        set {location = newValue}
    }
    
    var notesString: String {
        get {notes ?? ""}
        set {notes = newValue}
    }
}
