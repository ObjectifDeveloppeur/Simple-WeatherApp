//
//  UVIndexView.swift
//  Weather
//
//  Created by Maxime Lathiere on 19/10/2022.
//

import SwiftUI
import WeatherKit

struct UVIndexView: View {
    let uvIndex: UVIndex
    
    init(for uvIndex: UVIndex) {
        self.uvIndex = uvIndex
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            WeatherSectionView(.uvIndex)
            
            Text(uvIndex.value.description)
                .font(.largeTitle)
            
            Text(uvIndex.category.description)
                .font(.title2)
        
            UVBar(UVIndex: uvIndex.value)
        }
    }
}
