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
                MapView(location: location)
            }.padding()
            
            VStack {
                HStack {
                    Text("Name:\t\t").fontWeight(.bold)
                    TextField("Enter name", text: $location.nameString)
                }
                
                HStack {
                    Text("Latitude:\t").fontWeight(.bold)
                    TextField("Enter latitude", text: $location.latitudeString, onCommit: {
                        location.lookupName()
                    })
                }
                
                HStack {
                    Text("Longitude:").fontWeight(.bold)
                    TextField("Enter longitude", text: $location.longitudeString, onCommit: {
                        location.lookupName()
                    })
                }
                
                Button("Find coordinates for location name", action: {
                    location.lookupPosition()
                })
            }.padding()
        }.navigationTitle("Location")
    }
}
