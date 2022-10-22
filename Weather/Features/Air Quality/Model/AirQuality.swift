//
//  AirQuality.swift
//  Weather
//
//  Created by Maxime Lathiere on 22/10/2022.
//

import SwiftUI

//MARK: - AirQuality Model

struct AirQuality {
    let index: Double
}

extension AirQuality {
    var title: LocalizedStringKey {
        switch index {
        case 1: return "indexOne"
        case 2: return "indexTwo"
        case 3: return "indexThree"
        case 4: return "indexFour"
        default: return "indexFive"
        }
    }
}

//MARK: - AirQuality + Decodable

extension AirQuality: Decodable {
    enum CodingKeys: String, CodingKey {
        case index = "aqi"
    }
}

//MARK: - AirQuality Scale

extension AirQuality {
        static let scale: [Gradient.Stop] = [
            .init(color: .blue.opacity(0.8), location: 0.15),
            .init(color: .green, location: 0.35),
            .init(color: .yellow, location: 0.55),
            .init(color: .red, location: 0.75),
            .init(color: .purple, location: 1)
        ]
}

//MARK: - API Help Models
struct AirQualityResponse: Decodable {
    let list: [Detail]
}

extension AirQualityResponse {
    struct Detail: Decodable {
        let main: AirQuality
    }
}

