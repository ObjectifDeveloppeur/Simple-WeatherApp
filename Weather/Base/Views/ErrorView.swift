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
                .font(.system(size: 100))
            
            Text(error.localizedDescription)
                .font(.title2)
        }
        .foregroundStyle(.ultraThickMaterial)
        .padding()
    }
}
