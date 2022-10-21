//
//  Sky.swift
//  Weather
//
//  Created by Maxime Lathiere on 21/10/2022.
//

import SwiftUI
import WeatherKit

struct Sky {
    let weatherCondition: WeatherCondition
    
    var color: Color {
        switch weatherCondition {
        case .sunFlurries,
             .clear,
             .sunShowers,
             .mostlyClear,
             .breezy:
            return Theme.clearSky
        default:
            return Theme.cloudySky
        }
    }
}
