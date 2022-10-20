//
//  DateFormatter.swift
//  Weather
//
//  Created by Maxime Lathiere on 20/10/2022.
//

import Foundation

extension DateFormatter {
    static let weatherDateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd' 'HH:mm:ssZZZ"
        return dateFormatter
    }()
}
