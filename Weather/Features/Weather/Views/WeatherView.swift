//
//  WeatherView.swift
//  Weather
//
//  Created by Maxime Lathiere on 18/10/2022.
//

import SwiftUI
import WeatherKit

//MARK: - WeatherView

struct WeatherView: View {
    private let weather: Weather
    private let cityName: String
    
    init(for weather: Weather, in cityName: String) {
        self.weather = weather
        self.cityName = cityName
    }
    
    //MARK: Body
    
    var body: some View {
        VStack {
            WeatherHeaderView(for: weather, in: cityName)
            
            ScrollView(showsIndicators: false) {
                Group {
                    HourlyForecastView(for: weather.hourlyForecast.forecast.currentDay)
                    
                    TenDayForecastView(for: weather.dailyForecast.forecast)
                }
                .padding()
            }
        }
        .foregroundColor(.white)
    }
}

//MARK: - Preview

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
