//
//  LocationNameView.swift
//  EateriesCoreData
//
//  Created by Nguyen Chanh Tin on 5/28/21.
//

import SwiftUI

struct LocationNameView: View {
    @ObservedObject var location: Location
    
    var body: some View {
        Text(location.nameString)
    }
}
