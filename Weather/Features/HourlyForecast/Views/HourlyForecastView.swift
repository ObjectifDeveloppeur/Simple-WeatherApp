//
//  HourlyForecastView.swift
//  Weather
//
//  Created by Maxime Lathiere on 18/10/2022.
//

import SwiftUI
import WeatherKit

//MARK: - HourlyForecastView

struct HourlyForecastView: View {
    private let hourlyForecast: [HourWeather]
    
    init(for hourlyForecast: [HourWeather]) {
        self.hourlyForecast = hourlyForecast
    }
    
    //MARK: Body
    
    var body: some View {
        VStack(spacing: 10) {
            WeatherSectionView(.hourlyForecast)
                .padding(.horizontal)
                .padding(.top, 6)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 18) {
                    ForEach(hourlyForecast,
                            id: \.date,
                            content: HourlyForecastRow.init)
                }
                .padding(.horizontal)
                .padding(.bottom, 6)
            }
        }
        .background(BlurView(style: .dark).opacity(0.3))
        .cornerRadius(8)
    }
}


//MARK: - Preview

struct HourlyForecastView_Previews: PreviewProvider {
    static var weather: Weather {
        return try! JSONMapper.decode(fileName: "WeatherData",
                                      type: Weather.self)
    }
    static var previews: some View {
        HourlyForecastView(for: weather.hourlyForecast.forecast)
            .padding()
            .background(SkyView(for: weather.currentWeather.condition))
            .foregroundColor(.white)
    }
}

