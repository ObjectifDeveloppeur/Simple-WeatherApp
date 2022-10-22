//
//  AirQualityView.swift
//  Weather
//
//  Created by Maxime Lathiere on 22/10/2022.
//

import SwiftUI

struct AirQualityView: View {
    private let airQuality: AirQuality
    
    init(for airQuality: AirQuality) {
        self.airQuality = airQuality
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            WeatherSectionView(.airQuality(airQuality.index))
            
            Text(airQuality.title)
                .font(.title2)
            
            AirQualityBar(for: airQuality)
        }
        .cellBackground()
    }
}

struct AirQualityView_Previews: PreviewProvider {
    static var previews: some View {
        AirQualityView(for: .init(index: 3))
            .padding()
            .background(Theme.clearSky)
            .padding()
    }
}
