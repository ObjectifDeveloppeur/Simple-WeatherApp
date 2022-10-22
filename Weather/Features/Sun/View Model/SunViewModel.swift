//
//  SunViewModel.swift
//  Weather
//
//  Created by Maxime Lathiere on 20/10/2022.
//

import SwiftUI
import WeatherKit


//MARK: - SunViewModel

final class SunViewModel: ObservableObject {
    private let weather: Weather
    
    init(weather: Weather) {
        self.weather = weather
    }
    
    @Published private(set) var sunLineOffset: Double = .zero
    @Published private(set) var lightPercentage: Double = .zero
    
    func setUp(with size: CGSize) {
        guard let sunset = weather.dailyForecast.forecast.first?.sun.sunset,
              let sunrise = weather.dailyForecast.forecast.first?.sun.sunrise else {
            return
        }
        
        let lightTime = calculateLightTime(from: sunrise, to: sunset)
        calculateLightPercentage(from: lightTime)
        sunLineOffset = size.height * lightPercentage
    }
}


//MARK: - Methods

private extension SunViewModel {
    func calculateLightTime(from sunrise: Date,
                            to sunset: Date) -> TimeInterval {
        sunset - sunrise
    }
    
    func calculateLightPercentage(from lightTime: TimeInterval) {
        let dayInSeconds: TimeInterval = 86_400
        lightPercentage = lightTime / dayInSeconds
    }
}

//MARK: - Helpers

extension SunViewModel {
    var isDaylight: Bool {
        weather.currentWeather.isDaylight
    }
    
    var sunset: String {
        weather.dailyForecast.first?.sun.sunset?.formatted(date: .omitted, time: .shortened) ?? "No value"
    }
    
    var sunrise: String {
        weather.dailyForecast.first?.sun.sunrise?.formatted(date: .omitted, time: .shortened) ?? "No value"
    }
    
    var header: String {
        isDaylight ? sunset : sunrise
    }
    
    var localizedFooter: LocalizedStringKey {
        if isDaylight {
            return "sunriseTitle"
        } else {
            return "sunsetTitle"
        }
    }
    
    var hourFooter: String {
        if isDaylight {
            return sunrise
        } else {
            return sunset
        }
    }
}
