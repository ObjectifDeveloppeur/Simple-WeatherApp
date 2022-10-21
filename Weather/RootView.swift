//
//  RootView.swift
//  Weather
//
//  Created by Maxime Lathiere on 18/10/2022.
//

import SwiftUI
import CoreLocation

//MARK: - RootView

struct RootView: View {
    @StateObject private var vm: WeatherViewModel
    
    init() {
        self._vm = StateObject(wrappedValue: WeatherViewModel())
    }
    
    //MARK: Body
    
    var body: some View {
        Group {
            switch vm.state {
            case .loading:
                progressView
                    .task(id: vm.currentLocation) {
                        await vm.getWeather()
                    }
            case let .loaded(weather, cityName):
                WeatherView(for: weather, in: cityName)
            case .error(let error):
                ErrorView(for: error)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Theme.clearSky)
    }
}


//MARK: - SubView

private extension RootView {
    var progressView: some View {
        ProgressView()
            .padding(30)
            .background(.ultraThickMaterial)
            .cornerRadius(8)
    }
}


//MARK: - Preview

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}

