//
//  CellBackground+View.swift
//  Weather
//
//  Created by Maxime Lathiere on 19/10/2022.
//

import SwiftUI

extension View {
    func cellBackground() -> some View {
        self.padding(.horizontal)
            .padding(.top, 6)
            .padding(.bottom, 10)
            .background(.ultraThinMaterial.opacity(0.4))
            .cornerRadius(8)
    }
}
