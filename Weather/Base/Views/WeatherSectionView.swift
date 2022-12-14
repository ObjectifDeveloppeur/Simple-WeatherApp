//
//  SectionHeaderView.swift
//  Weather
//
//  Created by Maxime Lathiere on 19/10/2022.
//

import SwiftUI

struct WeatherSectionView: View {
    private let section: WeatherSection
    
    init(_ weatherSection: WeatherSection) {
        self.section = weatherSection
    }
    
    var body: some View {
        HStack {
            section.symbolName
            
            Text(section.title)
                .textCase(.uppercase)
        }
        .font(.caption)
        .foregroundStyle(.secondary)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical, 6)
    }
}

struct SectionHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherSectionView(.airQuality(3))
    }
}
