//
//  AirQualityRequest.swift
//  Weather
//
//  Created by Maxime Lathiere on 21/10/2022.
//

import Foundation

struct AirQualityRequest: Request {
    let latitude: Double
    let longitude: Double
    
    /// Free API Key (Open Weather Map) if you use it too much it will get blocked.
    let apiKey = "23e93c57ca04b0e895e8a15076bb58a9"
    
    let host = "api.openweathermap.org"
    let path = "/data/2.5/air_pollution"
    
    var querryItems: [String: String] {
        var items: [String: String] = [:]

        items["lat"] = "\(latitude)"
        items["lon"] = "\(longitude)"
        items["appid"] = "\(apiKey)"
        
        return items
    }
    
    var url: URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = host
        urlComponents.path = path
        urlComponents.queryItems = querryItems.map { URLQueryItem(name: $0.key, value: $0.value) }
        return urlComponents.url
    }
    
    func decode(_ data: Data) throws -> AirQuality? {
        let decoder = JSONDecoder()
        let airQualityResponse = try decoder.decode(AirQualityResponse.self, from: data)
        return airQualityResponse.list.first?.main
    }
}
