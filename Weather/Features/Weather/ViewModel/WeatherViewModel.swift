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
    private let locationService: Locating
    private let geocoder: Geocoding
    
    init(locationService: Locating = LocationService(),
         geocoder: Geocoding = Geocoder()
    ) {
        self.weatherService = WeatherService.shared
        self.locationService = locationService
        self.geocoder = geocoder
        subscribeToLocation()
    }
    
    @Published private(set) var state: State = .loading
    @Published private(set) var currentLocation: CLLocation?
    
    @MainActor
    func getWeather() async {
        guard let currentLocation else { return }
        
        state = .loading
        
        do {
            let weather = try await weatherService.weather(for: currentLocation)
            let cityName = try await geocoder.getLocationName(from: currentLocation)
            state = .loaded(weather: weather, cityName: cityName)
        } catch {
            state = .error(error)
        }
    }
    
    private func subscribeToLocation() {
        guard let locationManager = locationService as? LocationService else { return }
        
        Task {
            for await value in locationManager.$location.values {
                await MainActor.run(body: {
                    currentLocation = value
                })
            }
        }
    }
}

extension WeatherViewModel {
    enum State {
        case loading
        case loaded(weather: Weather, cityName: String)
        case error(Error)
    }
}

