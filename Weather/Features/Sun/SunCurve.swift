//
//  SunLine.swift
//  Weather
//
//  Created by Maxime Lathiere on 19/10/2022.
//

import SwiftUI

struct SunCurve: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addCurve(to: CGPoint(x: rect.midX, y: rect.minY),
                          control1: CGPoint(x: rect.midX / 2, y: rect.maxY),
                          control2: CGPoint(x: rect.midX * 0.75, y: rect.minY))
            path.addCurve(to: CGPoint(x: rect.maxX, y: rect.maxY),
                          control1: CGPoint(x: rect.midX * 1.25, y: rect.minY),
                          control2: CGPoint(x: rect.maxX * 0.75, y: rect.maxY))
        }
    }
}
