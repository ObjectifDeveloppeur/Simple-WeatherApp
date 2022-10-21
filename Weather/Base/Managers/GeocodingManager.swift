//
//  GeocodingManager.swift
//  Weather
//
//  Created by Maxime Lathiere on 19/10/2022.
//

import Foundation
import CoreLocation

protocol Geocoding {
    func getLocationName(from location: CLLocation) async throws -> String
}

struct GeocodingManager: Geocoding {
    func getLocationName(from location: CLLocation) async throws -> String {
        do {
            let placemark = try await CLGeocoder().reverseGeocodeLocation(location)
            
            if let locality = placemark.first?.locality {
                return locality
            } else {
                throw Error.failedToGeocode
            }
        } catch {
            throw Error.failedToGeocode
        }
    }
}

extension GeocodingManager {
    enum Error: Swift.Error {
    case failedToGeocode
    }
}
