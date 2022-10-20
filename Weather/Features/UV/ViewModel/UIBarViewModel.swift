//
//  UIBarViewModel.swift
//  Weather
//
//  Created by Maxime Lathiere on 19/10/2022.
//

import SwiftUI

//MARK: - UVBarViewModel

extension UVBar {
    final class UVBarViewModel: ObservableObject {
        private let currentUVIndex: Int
        
        init(currentUVIndex: Int) {
            self.currentUVIndex = currentUVIndex
        }
        
        @Published var indicatorOffset: Double = .zero
        
        func setUp(with size: CGSize) {
            indicatorOffset = size.width * (Double(currentUVIndex) / 16)
        }
    }
}
