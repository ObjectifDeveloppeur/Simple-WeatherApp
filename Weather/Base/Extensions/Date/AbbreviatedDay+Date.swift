//
//  AbbreviatedDay+Date.swift
//  Weather
//
//  Created by Maxime Lathiere on 19/10/2022.
//

import Foundation

extension Date {
    func abbreviatedDay() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE"
        return formatter.string(from: self)
    }
}
