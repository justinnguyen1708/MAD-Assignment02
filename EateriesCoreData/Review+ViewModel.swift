//
//  Review+ViewModel.swift
//  EateriesCoreData
//
//  Created by Nguyen Chanh Tin on 5/13/21.
//

import Foundation

extension Review {
    /// Non-optional ViewModel author property
    var authorString: String {
        get { author ?? ""}
        set { author = newValue}
    }
    
    /// Non-optional ViewModel comment property
    var commentString: String {
        get { comment ?? ""}
        set { comment = newValue}
    }
}
