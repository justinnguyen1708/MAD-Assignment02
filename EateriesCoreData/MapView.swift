//
//  MapView.swift
//  EateriesCoreData
//
//  Created by Nguyen Chanh Tin on 5/27/21.
//

import MapKit
import UIKit
import SwiftUI

struct MapView: UIViewRepresentable {
    @ObservedObject var location: Location
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView(frame: .zero)
        mapView.delegate = location
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.setRegion(location.region, animated: true)
    }
}
