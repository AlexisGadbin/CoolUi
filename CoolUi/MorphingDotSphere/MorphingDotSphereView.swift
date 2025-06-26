//
//  MorphingDotSphereView.swift
//  CoolUi
//
//  Created by Alexis Gadbin on 24/05/2025.
//

import SwiftUI

struct MorphingDotSphereView: View {
    @State private var morphAmount: Double = 100
    @State private var dots: [Dot] = []
    @State private var dotCount: Int = 800

    var body: some View {
        VStack {
            GeometryReader { geometry in
                let centerX = geometry.size.width / 2
                let centerY = geometry.size.height / 2

                MorphingDotAnimation(
                    morphAmount: morphAmount,
                    dots: dots,
                    centerX: centerX,
                    centerY: centerY
                )
            }

            Slider(value: $morphAmount, in: 0...100)
                .padding(.horizontal, 20)
                .accentColor(.white)
                .padding(.bottom, 40)

            Slider(
                value: Binding(
                    get: { Double(dotCount) },
                    set: { dotCount = Int($0) }
                ),
                in: 50...3000,
                step: 1
            )
            .accentColor(.white)
            .padding(.horizontal, 20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        .onAppear {
            if dots.count != dotCount {
                dots = (0..<dotCount).map { _ in
                    generateRandomDot()
                }
            }
        }
        .onChange(of: dotCount) { _, newValue in
            if dots.count != newValue {
                dots = (0..<newValue).map { _ in
                    generateRandomDot()
                }
            }
        }
    }
}

#Preview {
    MorphingDotSphereView()
}
