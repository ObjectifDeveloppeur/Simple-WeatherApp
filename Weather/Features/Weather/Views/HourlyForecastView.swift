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
        VStack(spacing: 0) {
            WeatherSectionView(.hourlyForecast)
                .padding(.horizontal, 6)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 18) {
                    ForEach(hourlyForecast,
                            id: \.date,
                            content: HourlyForecastRow.init)
                }
                .padding()
            }
        }
        .background(.ultraThinMaterial.opacity(0.4))
        .cornerRadius(8)
    }
}


//MARK: - Preview

struct HourlyForecastView_Previews: PreviewProvider {
    static var previews: some View {
        HourlyForecastView(for: [])
    }
}
