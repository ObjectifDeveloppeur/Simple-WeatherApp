//
//  WeatherSection.swift
//  Weather
//
//  Created by Maxime Lathiere on 19/10/2022.
//

import SwiftUI

enum WeatherSection {
    case airQuality(Double)
    case hourlyForecast
    case tenDayForecast
    case uvIndex
    case sun(Bool)
}

extension WeatherSection {
    var title: LocalizedStringKey {
        switch self {
        case .airQuality:
            return "airQualityTitle"
        case .hourlyForecast:
            return "hourlyForecastTitle"
        case .tenDayForecast:
            return "tenDayForecastTitle"
        case .uvIndex:
            return "uvIndexTitle"
        case .sun(let isDaylight):
            return isDaylight ? "sunsetTitle" : "sunriseTitle"
        }
    }
    
    var symbolName: Image {
        switch self {
        case .airQuality(let index):
            switch index {
            case 1: return Symbol.aqiLow
            case 2: return Symbol.aqiMedium
            default: return Symbol.aqiHigh
            }
        case .hourlyForecast:
            return Symbol.hourlyForecast
        case .tenDayForecast:
            return Symbol.tenDayForecast
        case .uvIndex:
            return Symbol.uvIndex
        case .sun(let isDaylight):
            return isDaylight ? Symbol.sunset : Symbol.sunrise
        }
    }
}
