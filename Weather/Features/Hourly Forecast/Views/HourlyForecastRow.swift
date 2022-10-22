//
//  HourlyForecastRow.swift
//  Weather
//
//  Created by Maxime Lathiere on 19/10/2022.
//

import SwiftUI
import WeatherKit

//MARK: - HourlyForecastRow

struct HourlyForecastRow: View {
    let hourlyForecast: HourWeather
    
    //MARK: Body
    
    var body: some View {
        VStack(spacing: 10) {
            Text(hourlyForecast.date.formatted(.dateTime.hour()))
            
            Image(systemName: hourlyForecast.symbolName)
                .symbolVariant(.fill)
                .symbolRenderingMode(.multicolor)
            
            Text(hourlyForecast.temperature.narrowFormatted())
        }
    }
}
