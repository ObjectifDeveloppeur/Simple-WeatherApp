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
    private let weatherData: WeatherData
    
    init(for weatherData: WeatherData) {
        self.weatherData = weatherData
    }
    
    //MARK: Body
    
    var body: some View {
        VStack {
            WeatherHeaderView(for: weatherData)
            
            ScrollView(showsIndicators: false) {
                Group {
                    if let airQuality = weatherData.airQuality {
                        AirQualityView(for: airQuality)
                    }
                    HourlyForecastView(for: weatherData.weather.hourlyForecast.forecast.currentDay)
                    
                    TenDayForecastView(for: weatherData.weather.dailyForecast.forecast)
                    
                    HStack {
                        UVIndexView(for: weatherData.weather.currentWeather.uvIndex)
                        
                        SunView(for: weatherData.weather)
                    }
                }
                .padding()
            }
        }
        .foregroundColor(.white)
        .background(SkyView(for: weatherData.weather.currentWeather.condition))
    }
}

//MARK: - Preview

struct WeatherView_Previews: PreviewProvider {
    static var weather: Weather {
        return try! JSONMapper.decode(fileName: "WeatherData",
                                      type: Weather.self)
    }
    static var previews: some View {
        WeatherView(for: (weather, "Marseille", .init(index: 3)))
            .background(.blue)
    }
}
