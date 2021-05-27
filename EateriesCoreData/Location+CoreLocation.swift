//
//  Location+CoreLocation.swift
//  EateriesCoreData
//
//  Created by Nguyen Chanh Tin on 5/27/21.
//

import CoreLocation
import CoreData

private var isGeoCoding = false

extension Location {
    var location: CLLocation {
        get { CLLocation(latitude: latitude, longitude: longitude)}
        set {
            latitude = newValue.coordinate.latitude
            longitude = newValue.coordinate.longitude
        }
    }
    
    var coordinates: CLLocationCoordinate2D {
        get { CLLocationCoordinate2D(latitude: latitude, longitude: longitude)}
        set {
            latitude = newValue.latitude
            longitude = newValue.longitude
        }
    }
    
    var viewContext: NSManagedObjectContext {
        managedObjectContext ?? NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    }
    
    func lookupName() {
        guard !isGeoCoding else {return}
        isGeoCoding = true
        let geoCoder = CLGeocoder()
        
        geoCoder.reverseGeocodeLocation(location) {
            isGeoCoding = false
            guard let placeMarks = $0, let placeMark = placeMarks.first else {
                if let error = $1 {
                    print("Error looking up location \(error.localizedDescription)")
                } else {
                    print("Error looking up location \(String(describing: $1))")
                }
                return
            }
            
            self.name = placeMark.locality ?? placeMark.subLocality ?? placeMark.administrativeArea ?? placeMark.country ?? "<unknown>"
        }
        
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    func lookupPosition() {
        guard !isGeoCoding else {return}
        isGeoCoding = true
        let geoCoder = CLGeocoder()
        
        geoCoder.geocodeAddressString(self.nameString) {
            isGeoCoding = false
            guard let placeMarks = $0, let placeMark = placeMarks.first, let coordinates = placeMark.location?.coordinate else {
                if let error = $1 {
                    print("Error looking up locaiton \(error.localizedDescription)")
                } else {
                    print("Error looking up location \(String(describing: $1))")
                }
                return
            }
            
            self.latitude     = coordinates.latitude
            self.longitude   = coordinates.longitude
        }
        
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}
