//
//  DayForecastRow.swift
//  Weather
//
//  Created by Maxime Lathiere on 19/10/2022.
//

import SwiftUI
import WeatherKit

//MARK: - DayForecastRow

struct DayForecastRow: View {
    let dayWeather: DayWeather
    
    //MARK: Body
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                day ; symbol ; lowTemperature ; highTemperature
            }
            .bold()
            
            Divider()
                .overlay(.secondary)
        }
    }
}


//MARK: - SubViews

private extension DayForecastRow {
    var day: some View {
        Text(dayWeather.date.abbreviatedDay().capitalized)
            .frame(width: 60, alignment: .leading)
    }
    
    var symbol: some View {
        Image(systemName: dayWeather.symbolName)
            .symbolVariant(.fill)
            .symbolRenderingMode(.multicolor)
            .frame(width: 60, alignment: .leading)
    }
    
    var lowTemperature: some View {
        Text(dayWeather.lowTemperature.narrowFormatted())
    }
    
    var highTemperature: some View {
        Text(dayWeather.highTemperature.narrowFormatted())
            .frame(maxWidth: .infinity, alignment: .trailing)
    }
}
