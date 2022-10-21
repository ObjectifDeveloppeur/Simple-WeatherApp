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
                    
                    HStack {
                        UVIndexView(for: weather.currentWeather.uvIndex)
                        
                        SunView(for: weather)
                    }
                }
                .padding()
            }
        }
        .foregroundColor(.white)
        .background(SkyView(for: weather.currentWeather.condition))
    }
}

//MARK: - Preview

struct WeatherView_Previews: PreviewProvider {
    static var weather: Weather {
        return try! JSONMapper.decode(fileName: "WeatherData",
                                      type: Weather.self)
    }
    static var previews: some View {
        WeatherView(for: weather, in: "Marseille")
            .background(.blue)
    }
}
