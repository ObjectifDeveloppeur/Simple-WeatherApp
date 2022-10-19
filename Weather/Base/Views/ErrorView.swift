//
//  ErrorView.swift
//  Weather
//
//  Created by Maxime Lathiere on 19/10/2022.
//

import SwiftUI

struct ErrorView: View {
    private let error: Error
    
    init(for error: Error) {
        self.error = error
    }
    
    var body: some View {
        VStack {
            Symbol.error
            
            Text(error.localizedDescription)
        }
        .font(.largeTitle)
        .foregroundStyle(.ultraThickMaterial)
    }
}
