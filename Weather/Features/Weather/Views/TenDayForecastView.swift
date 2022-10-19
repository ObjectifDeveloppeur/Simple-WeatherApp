//
//  TenDayForecastView.swift
//  Weather
//
//  Created by Maxime Lathiere on 18/10/2022.
//

import SwiftUI
import WeatherKit

//MARK: - TenDayForecastView

struct TenDayForecastView: View {
    private let tenDayWeather: [DayWeather]
    
    init(for tenDayWeather: [DayWeather]) {
        self.tenDayWeather = tenDayWeather
    }
    
    //MARK: - Body
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            Group {
                WeatherSectionView(.tenDayForecast)
                
                ForEach(tenDayWeather, id: \.date, content: DayForecastRow.init)
            }
            .padding(.horizontal)
        }
        .background(.ultraThinMaterial.opacity(0.4))
        .cornerRadius(8)
    }
}

//MARK: - Preview

struct TenDayForecastView_Previews: PreviewProvider {
    static var previews: some View {
        TenDayForecastView(for: [])
    }
}
