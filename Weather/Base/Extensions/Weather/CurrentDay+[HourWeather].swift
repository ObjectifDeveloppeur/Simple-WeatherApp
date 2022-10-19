//
//  CurrentDay+[HourWeather].swift
//  Weather
//
//  Created by Maxime Lathiere on 18/10/2022.
//

import Foundation
import WeatherKit

extension Array where Element == HourWeather {
    var currentDay: [HourWeather] {
        filter { $0.date > .now }
            .prefix(24)
            .map { $0 }
    }
}
