//
//  LocationManager.swift
//  Weather
//
//  Created by Maxime Lathiere on 18/10/2022.
//

import Foundation
import CoreLocation

protocol Locating {
    var location: CLLocation? { get }
}

final class LocationManager: NSObject, Locating {
    private let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
    }
    
    @Published var location: CLLocation?
}


//MARK: - CLLocationManagerDelegate

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
              guard let location = locations.last else { return }
              DispatchQueue.main.async {
                  self.location = location
              }
      }
}
