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
}

extension WeatherSection {
    var title: String {
        switch self {
        case .hourlyForecast:
            return "Prévisions heure par heure"
        case .tenDayForecast:
            return "Prévisions sur 10 jours"
        }
    }
    
    var symbolName: Image {
        switch self {
        case .hourlyForecast:
            return Symbol.hourlyForecast
        case .tenDayForecast:
            return Symbol.tenDayForecast
        }
    }
}
