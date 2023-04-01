//
//  ContentModel.swift
//  CitySights
//
//  Created by Alex Tran on 3/25/23.

import Foundation
import CoreLocation

class ContentModel: NSObject, CLLocationManagerDelegate, ObservableObject {
    var locationManager = CLLocationManager()
    @Published var authorizationState = CLAuthorizationStatus.notDetermined
    @Published var locations = [PickupData]()
    
    override init() {
        // Init method of NSObject
        super.init()
        // Set content model as the delegate of the location manager
        locationManager.delegate = self
    }
    func requestGeoLocationPermission() {
        // Request permission from the user
        locationManager.requestWhenInUseAuthorization()
    }
    
    // MARK: - Location Manager Delegate Methods
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        self.authorizationState = locationManager.authorizationStatus
        if locationManager.authorizationStatus == .authorizedAlways ||
            locationManager.authorizationStatus == .authorizedWhenInUse {
            
            // We have permission
            // Start geolocating the user, after we get permission
            locationManager.startUpdatingLocation()
        }
        else if locationManager.authorizationStatus == .denied {
            // We don't have permission
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        // Gives us the location of the user
        let userLocation = locations.first
        
        if userLocation != nil {
            
            // We have a location
            // Stop requesting the location after we get it once
            locationManager.stopUpdatingLocation()
            getPickups()
        }
    }
    
    func getPickups() {
        
        // Create URL
        let url = URL(string: "https://websocketcackend.herokuapp.com/api/get/route")
        
        if let url = url {
            // Create URL Request
            var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10.0)
            request.httpMethod = "GET"
            // Get URLSession
            let session = URLSession.shared
            // Create Data Task
            let dataTask = session.dataTask(with: request) { (data, response, error) in
                // Check that there isn't an error
                if error == nil {
                    do {
                        // Parse json
                        let decoder = JSONDecoder()
                        let result = try decoder.decode([PickupData].self, from: data!)
                        // assign result to the appropriate property
                        DispatchQueue.main.async {
                            self.locations = result
                        }
                    }
                    catch {
                        print(error)
                    }
                }
            }
            // Start the Data Task
            dataTask.resume()
        }
        
    }
    
    
}
