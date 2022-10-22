//
//  WeatherHeaderView.swift
//  Weather
//
//  Created by Maxime Lathiere on 18/10/2022.
//

import SwiftUI
import WeatherKit

//MARK: - WeatherHeaderView

struct WeatherHeaderView: View {
    private let weatherData: WeatherData
   
    init(for weatherData: WeatherData) {
        self.weatherData = weatherData
    }
    
    
    //MARK: - Body
    
    var body: some View {
        VStack {
            city
            temperature
            condition
            temperatureVariation
        }
        .fontWeight(.semibold)
    }
}

//MARK: - SubViews

private extension WeatherHeaderView {
    var city: some View {
        Text(weatherData.cityName)
            .font(.largeTitle)
    }
    
    var temperature: some View {
        Text(currentWeather.temperature.narrowFormatted())
            .font(.system(size: 60))
    }
    
    var condition: some View {
        Text(currentWeather.condition.description)
    }
    
    @ViewBuilder
    var temperatureVariation: some View {
        if let today = weatherData.weather.dailyForecast.first {
            Text("H:\(today.highTemperature.narrowFormatted()) L:\(today.lowTemperature.narrowFormatted())")
        }
    }
}


//MARK: - Helper

private extension WeatherHeaderView {
    var currentWeather: CurrentWeather {
        weatherData.weather.currentWeather
    }
}

//MARK: - Preview

struct WeatherHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}

