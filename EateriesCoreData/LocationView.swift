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
        VStack {
            VStack {
                Text("Location")
                    .font(.largeTitle)
                    .fontWeight(.medium)
                MapView(location: location)
            }.padding()
            
            VStack {
                TextField("Enter name", text: $location.nameString)
                HStack {
                    Text("Latitude:     ")
                    TextField("Enter latitude", text: $location.latitudeString, onCommit: {
                        location.lookupName()
                    })
                }
                
                HStack {
                    Text("Longitude: ")
                    TextField("Enter longitude", text: $location.longitudeString, onCommit: {
                        location.lookupName()
                    })
                        
                }
                
                Button("Find coordinates for location name", action: {
                    location.lookupPosition()
                })
            }.padding()
        }
    }
}
