//
//  SunsetView.swift
//  Weather
//
//  Created by Maxime Lathiere on 19/10/2022.
//

import SwiftUI
import WeatherKit

struct SunView: View {
    @StateObject private var vm: SunViewModel
    
    init(for weather: Weather) {
        self._vm = StateObject(wrappedValue: SunViewModel(weather: weather))
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            WeatherSectionView(.sun(vm.isDaylight))
            
            Text(vm.header)
            
            ZStack(alignment: .topLeading) {
                SunCurve()
                    .stroke(lineWidth: 4)
                    .onGettingViewSize(action: vm.setUp)
                    .foregroundStyle(solarGradient)
                
                
                Color.white
                    .frame(height: 0.75)
                    .offset(y: vm.sunLineOffset)
            }
            
            Text(vm.localizedFooter)
            + Text(" \(vm.sunrise)")
        }
        .cellBackground()
    }
}


//MARK: - SolarGradient

private extension SunView {
    var solarGradient: LinearGradient {
        LinearGradient(stops: solarGradientStops,
                       startPoint: .top,
                       endPoint: .bottom)
    }
    
    var solarGradientStops: [Gradient.Stop] {
        [
            .init(color: .white.opacity(0.7), location: vm.lightPercentage),
            .init(color: .secondary, location: vm.lightPercentage)
        ]
    }
}

//MARK: - Preview

struct SunView_Previews: PreviewProvider {
    static var weather: Weather {
        return try! JSONMapper.decode(fileName: "WeatherData",
                                      type: Weather.self)
    }
    static var previews: some View {
        SunView(for: weather)
            .padding(50)
            .background(SkyView(for: weather.currentWeather.condition))
    }
}
