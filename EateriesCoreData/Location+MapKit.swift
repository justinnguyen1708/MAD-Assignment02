//
//  Location+MapKit.swift
//  EateriesCoreData
//
//  Created by Nguyen Chanh Tin on 5/27/21.
//

import MapKit

private var updateCount = 0

extension Location: MKMapViewDelegate {
    /// Coordinate span to support MapView
    var coordinateSpan: MKCoordinateSpan {
        get { MKCoordinateSpan(latitudeDelta: self.latitudeSpan, longitudeDelta: self.longitudeSpan) }
        set {
            latitudeSpan    = newValue.latitudeDelta
            longitudeSpan  = newValue.longitudeDelta
        }
    }
    
    /// Region to support MapView
    var region: MKCoordinateRegion {
        get { MKCoordinateRegion(center: coordinates, span: coordinateSpan) }
        set { coordinateSpan = newValue.span }
    }
    
    /// Longitude and latitude are changed in one second after user navigation the location or update location name
    /// - Parameter mapView: MKMapView
    @objc public func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
        let centre = mapView.centerCoordinate
        updateCount += 1
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
            updateCount -= 1
            guard updateCount == 0 else { return }
            self.coordinates = centre
        }
    }
}
