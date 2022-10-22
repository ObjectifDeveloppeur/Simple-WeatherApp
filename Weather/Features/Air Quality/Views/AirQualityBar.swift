//
//  AirQualityView.swift
//  Weather
//
//  Created by Maxime Lathiere on 21/10/2022.
//

import SwiftUI
import CoreLocation

struct AirQualityBar: View {
    @StateObject private var vm: AirQualityBarViewModel
    
    init(for airQuality: AirQuality) {
        self._vm = StateObject(wrappedValue: AirQualityBarViewModel(currentAirQuality: airQuality))
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            LinearGradient(stops: AirQuality.scale,
                           startPoint: .leading,
                           endPoint: .trailing)
            .onGettingViewSize(action: vm.setUp)
            
            Circle()
                .foregroundColor(.white)
                .overlay {
                    Circle()
                        .stroke(lineWidth: 2)
                        .foregroundStyle(.blue)
                }
                .offset(x: vm.indicatorOffset)
        }
        .frame(height: 6)
        .cornerRadius(3)
    }
}

struct AirQualityBar_Previews: PreviewProvider {
    static var previews: some View {
        AirQualityBar(for: .init(index: 5))
            .padding()
    }
}
