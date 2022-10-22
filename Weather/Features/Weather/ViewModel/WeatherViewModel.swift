//
//  WeatherViewModel.swift
//  Weather
//
//  Created by Maxime Lathiere on 18/10/2022.
//

import Foundation
import WeatherKit
import CoreLocation

final class WeatherViewModel: ObservableObject {
    private let weatherService: WeatherService
    private let locationManager: Locating
    private let geocodingManager: Geocoding
    private let networkingManager: Networking
    
    init(locationService: Locating = LocationManager(),
         geocoder: Geocoding = GeocodingManager(),
         networkingManager: Networking = NetworkinManager()
    ) {
        self.weatherService = WeatherService.shared
        self.locationManager = locationService
        self.geocodingManager = geocoder
        self.networkingManager = networkingManager
        subscribeToLocation()
    }
    
    @Published private(set) var state: State = .loading
    @Published private(set) var currentLocation: CLLocation?
    
    @MainActor
    func getWeatherData() async {
        guard let currentLocation else { return }
        
        state = .loading
        
        do {
            async let weather = try weatherService.weather(for: currentLocation)
            async let cityName = try geocodingManager.getLocationName(from: currentLocation)
            async let airQuality = try networkingManager.fetch(AirQualityRequest(latitude: currentLocation.coordinate.latitude,
                                                                                 longitude: currentLocation.coordinate.longitude))
            state = try await .loaded(weatherData: (weather: weather, cityName: cityName, airQuality: airQuality))
        } catch {
            state = .error(error)
        }
    }
    
    private func subscribeToLocation() {
        guard let locationManager = locationManager as? LocationManager else { return }
        
        Task {
            for await value in locationManager.$location.values {
                await MainActor.run(body: {
                    currentLocation = value
                })
            }
        }
    }
}


typealias WeatherData = (weather: Weather, cityName: String, airQuality: AirQuality?)

extension WeatherViewModel {
    enum State {
        case loading
        case loaded(weatherData: WeatherData)
        case error(Error)
    }
}

