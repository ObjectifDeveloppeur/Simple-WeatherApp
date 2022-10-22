//
//  SkyView.swift
//  Weather
//
//  Created by Maxime Lathiere on 21/10/2022.
//

import SwiftUI
import WeatherKit

struct SkyView: View {
    private let sky: Sky
    
    init(for weatherCondition: WeatherCondition) {
        sky = Sky(weatherCondition: weatherCondition)
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(sky.color.gradient)
                .rotationEffect(.degrees(180))
                .ignoresSafeArea()
        }
    }
}

struct SkyView_Previews: PreviewProvider {
    static var weatherCondition: WeatherCondition {
        return try! JSONMapper.decode(fileName: "WeatherData",
                                      type: Weather.self)
        .currentWeather
        .condition
    }
    static var previews: some View {
        SkyView(for: weatherCondition)
    }
}


