//
//  WeatherSection.swift
//  Weather
//
//  Created by Maxime Lathiere on 19/10/2022.
//

import SwiftUI

enum WeatherSection {
    case hourlyForecast
    case tenDayForecast
    case uvIndex
    case sun(Bool)
}

extension WeatherSection {
    var title: String {
        switch self {
        case .hourlyForecast:
            return "Prévisions heure par heure"
        case .tenDayForecast:
            return "Prévisions sur 10 jours"
        case .uvIndex:
            return "Indice UV"
        case .sun(let isDaylight):
            return isDaylight ? "Sunset" : "Sunrise"
        }
    }
    
    var symbolName: Image {
        switch self {
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
