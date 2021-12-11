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
        let userLocation = locations.first
        
        if userLocation != nil {
            
            // We have a location
            // Stop requesting the location after we get it once
            locationManager.stopUpdatingHeading()
            
            // If we have the coordinates of the user, send into Yelp API
            //getBusnisses(category: "arts", location: userLocation!)
            getBusnisses(category: "restaurants", location: userLocation!)
        }
    }
    
    // MARK: - Yelp API methods
    
    func getBusnisses(category:String, location:CLLocation) {
        
        // Create URL
        var urlComponents = URLComponents(string: "https://api.yelp.com/v3/businesses/search")
        urlComponents?.queryItems = [
            URLQueryItem(name: "latitude", value: String(location.coordinate.latitude)),
            URLQueryItem(name: "longitude", value: String(location.coordinate.longitude)),
            URLQueryItem(name: "categories", value: category),
            URLQueryItem(name: "limit", value: "6")
        ]
        
        let url = urlComponents?.url
        
        if let url = url { // Checking if url is actual url, so basically checking if the url is not nil in other words
            
            // Create URL Request
            var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10.0)
            request.httpMethod = "GET"
            request.addValue("Bearer qJBnAG1CunuYR8Lq2mOZzoFFIG2dE3mTHcNG-S49TbQOn3RUgjivRaW6Ftwg1gxkuHmBtXBR9qxFw61PuQHXxx8R0WTdSa1f5Sw7MTqs__NMirDatPEUyXJkcPu0YXYx", forHTTPHeaderField: "Authorization")
            
            // Get URL Session
            let session = URLSession.shared
            
            // Create DataTask
            let dataTask = session.dataTask(with: request) { (data, response, error) in
                // Check that there is no error
                if error == nil {
                    print(response)
                }
            }
            
            // Start the DataTask
            dataTask.resume()
        }
        
        
        
    }
    
}
