//
//  Symbol.swift
//  Weather
//
//  Created by Maxime Lathiere on 19/10/2022.
//

import SwiftUI

enum Symbol {
    static let error = Image(systemName: "icloud.slash.fill")
    
    static let hourlyForecast = Image(systemName: "clock")
    static let tenDayForecast = Image(systemName: "calendar")
    static let uvIndex = Image(systemName: "sun.max.fill")
    static let sunset = Image(systemName: "sunset.fill")
    static let sunrise = Image(systemName: "sunrise.fill")
}
