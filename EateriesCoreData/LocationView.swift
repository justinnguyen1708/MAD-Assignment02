//
//  LocationView.swift
//  EateriesCoreData
//
//  Created by Nguyen Chanh Tin on 5/27/21.
//

import SwiftUI

struct LocationView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @ObservedObject var location: Location
    
    var body: some View {
        Text(location.nameString)
        Text(location.latitudeString)
        Text(location.longitudeString)
    }
}
