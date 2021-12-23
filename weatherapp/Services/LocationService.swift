//
//  LocationService.swift
//  weather
//
//  Created by Ricardo Lucas on 12/12/2021.
//

import Foundation
import CoreLocation

class LocationService: NSObject, ObservableObject, CLLocationManagerDelegate{
    let service = CLLocationManager()
    
    @Published var location: CLLocationCoordinate2D?
    
    @Published var isLoading = false
    
    override init(){
        super.init()
        service.delegate = self
    }
    
    func RequestLocation(){
        isLoading = true
        service.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
        isLoading = false
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error getting location",error)
        isLoading = false
    }
    
    
}
