//
//  NarrowTemperature+Measurment.swift
//  Weather
//
//  Created by Maxime Lathiere on 18/10/2022.
//

import Foundation

extension Measurement where UnitType == UnitTemperature {
    func narrowFormatted() -> String {
        formatted(.measurement(width: .narrow))
    }
}
