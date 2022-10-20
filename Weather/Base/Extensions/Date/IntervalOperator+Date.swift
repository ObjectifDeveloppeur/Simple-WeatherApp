//
//  IntervalOperator+Date.swift
//  Weather
//
//  Created by Maxime Lathiere on 20/10/2022.
//

import Foundation

extension Date {
    static func - (lhs: Date, rhs: Date) -> TimeInterval {
        return lhs.timeIntervalSinceReferenceDate - rhs.timeIntervalSinceReferenceDate
    }
}
