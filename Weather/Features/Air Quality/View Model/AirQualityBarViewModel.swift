//
//  AirQualityViewModel.swift
//  Weather
//
//  Created by Maxime Lathiere on 21/10/2022.
//

import Foundation
import CoreLocation

final class AirQualityBarViewModel: ObservableObject {
    let currentAirQuality: AirQuality
    
    init(currentAirQuality: AirQuality) {
        self.currentAirQuality = currentAirQuality
    }
    
    @Published var indicatorOffset: Double = .zero
    
    func setUp(with size: CGSize) {
        indicatorOffset = size.width * (Double(currentAirQuality.index) / 5) - size.width / 10
    }
}
