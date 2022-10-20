//
//  SizePreferenceKey.swift
//  Weather
//
//  Created by Maxime Lathiere on 19/10/2022.
//

import SwiftUI

//MARK: - SizePreferenceKey

struct SizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}


//MARK: - SizeModifier

struct SizeModifier: ViewModifier {
    private var sizeView: some View {
        GeometryReader { geometry in
            Color.clear
                .preference(key: SizePreferenceKey.self,
                            value: geometry.size)
        }
    }
    func body(content: Content) -> some View {
        content
            .overlay(sizeView)
    }
}


//MARK: - getViewSize() + View

extension View {
    func onGettingViewSize(action: @escaping (CGSize) -> Void) -> some View {
        modifier(SizeModifier())
            .onPreferenceChange(SizePreferenceKey.self) { newSize in
                action(newSize)
            }
    }
}
