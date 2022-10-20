//
//  UVScale+Gradient.Stop.swift
//  Weather
//
//  Created by Maxime Lathiere on 19/10/2022.
//

import SwiftUI

extension Gradient.Stop {
    static let uvScale: [Gradient.Stop] = [
        .init(color: .green, location: 0),
        .init(color: .yellow, location: 0.3125),
        .init(color: .orange, location: 0.4375),
        .init(color: .red, location: 0.6875),
        .init(color: .purple, location: 1)
    ]
}
