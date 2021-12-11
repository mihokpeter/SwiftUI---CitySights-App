//
//  ContentModel.swift
//  City Sights App
//
//  Created by Peter Mihók on 11/12/2021.
//

import Foundation
import CoreLocation // Need to import that library to get the user's location

class ContentModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    var locationManager = CLLocationManager()
    
    override init() {
        
        // Init method of NSObject
        super.init()
        
        // Set ContentModel as the delegate of the locationManager to control and know what has user pressed for the location permission
        locationManager.delegate = self
        
        // Request permision from the user
        locationManager.requestWhenInUseAuthorization()
        
        // TODO: Start geolocating the user, after we get permision
        //locationManager.startUpdatingLocation()
    }
    
    // MARK: - Location manager Delegate Methods
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if locationManager.authorizationStatus == .authorizedAlways || locationManager.authorizationStatus == .authorizedWhenInUse {
            
            // We have permission
            // Start geolocating the user, after we get permission
            locationManager.startUpdatingLocation()
            
        } else if locationManager.authorizationStatus == .denied {
            
            // We don't have permission
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        // Gives us the location of the user
        print(locations.first ?? "no location")
        
        // TODO: If we have the coordinates of the user, send into Yelp API
        
        // Stop requesting the location after we get it once
        locationManager.stopUpdatingHeading()
    }
    
}
