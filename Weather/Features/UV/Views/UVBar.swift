//
//  UVBar.swift
//  Weather
//
//  Created by Maxime Lathiere on 19/10/2022.
//

import SwiftUI

//MARK: - UVBar View

struct UVBar: View {
    @StateObject private var vm: UVBarViewModel
    
    init(UVIndex: Int) {
        self._vm = StateObject(wrappedValue: UVBarViewModel(currentUVIndex: UVIndex))
    }
    
    //MARK: Body
    
    var body: some View {
        ZStack(alignment: .leading) {
            LinearGradient(stops: Gradient.Stop.uvScale,
                           startPoint: .leading,
                           endPoint: .trailing)
            .onGettingViewSize(action: vm.setUp)
            
            Circle()
                .foregroundColor(.white)
                .overlay {
                    Circle()
                        .stroke(lineWidth: 2)
                        .foregroundStyle(.blue)
                }
                .offset(x: vm.indicatorOffset)
        }
        .frame(height: 6)
        .cornerRadius(3)
    }
}


//MARK: - Preview

struct UVBar_Previews: PreviewProvider {
    static var previews: some View {
        UVBar(UVIndex: 15)
            .padding()
    }
}
