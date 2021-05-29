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
    
    /// <#Description#>
    /// - Parameter context: <#context description#>
    /// - Returns: <#description#>
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView(frame: .zero)
        mapView.delegate = location
        return mapView
    }
    
    /// <#Description#>
    /// - Parameters:
    ///   - uiView: <#uiView description#>
    ///   - context: <#context description#>
    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.setRegion(location.region, animated: true)
    }
}
