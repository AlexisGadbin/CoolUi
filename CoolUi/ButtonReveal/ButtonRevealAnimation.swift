//
//  ButtonRevealAnimation.swift
//  CoolUi
//
//  Created by Alexis Gadbin on 21/04/2025.
//

import SwiftUI

struct ButtonRevealAnimation: View {
    @State private var isRevealed = false
    
    static var imageSize: CGFloat = 24
    static var spacing: CGFloat = 8
    static var innerPadding: CGFloat = 2
    static var outerPadding: CGFloat = 8
    
    private var revealedButtons: [ReaveledButtonType] = [
        ReaveledButtonType(id: UUID(), iconImage: "face.smiling.inverse", backgroundColor: .green),
        ReaveledButtonType(id: UUID(), iconImage: "message.fill", backgroundColor: .blue),
        ReaveledButtonType(id: UUID(), iconImage: "bookmark.fill", backgroundColor: .purple),
        ReaveledButtonType(id: UUID(), iconImage: "heart.fill", backgroundColor: .red)
    ]
    
    var offSet: CGFloat {
        isRevealed ? CGFloat(revealedButtons.count + 1) * (Self.imageSize + Self.spacing + 2*(Self.innerPadding + Self.outerPadding)) : 0
    }
    
    var body: some View {
        HStack(spacing: Self.spacing) {
            Button {
                withAnimation(.spring()) {
                    isRevealed.toggle()
                }
            } label: {
                Image(systemName: "plus")
                    .resizable()
                    .scaledToFit()
                    .frame(width: Self.imageSize, height: Self.imageSize)
                    .padding(Self.innerPadding)
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
            }
            .rotationEffect(.degrees(isRevealed ? 225 : 0))
            .padding(Self.outerPadding)
            .background(.gray)
            .clipShape(Circle())
            .offset(x: offSet)
            
            ForEach(revealedButtons) { button in
                RevealedButton(iconImage: button.iconImage, backgroundColor: button.backgroundColor, isRevealed: isRevealed)
                    .opacity(isRevealed ? 1 : 0)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .safeAreaPadding(.horizontal)
    }
}
    
struct ReaveledButtonType : Identifiable {
    var id: UUID
    var iconImage: String
    var backgroundColor: Color
}

struct RevealedButton: View {
    @State private var rotation = 0.0
    let iconImage: String
    let backgroundColor: Color
    let isRevealed: Bool
    
    var body: some View {
        Button {
        } label: {
            Image(systemName: iconImage)
                .resizable()
                .scaledToFit()
                .frame(width: ButtonRevealAnimation.imageSize, height: ButtonRevealAnimation.imageSize)
                .padding(ButtonRevealAnimation.innerPadding)
                .foregroundStyle(.white)
                .onChange(of: isRevealed) { newValue in
                    withAnimation(.spring()) {
                        rotation += newValue ? 360 : -360
                    }
                }
        }
        .transaction { $0.disablesAnimations = true }
        .rotationEffect(.degrees(rotation))
        .padding(ButtonRevealAnimation.outerPadding)
        .background(backgroundColor)
        .clipShape(Circle())
    }
}

#Preview {
    ButtonRevealAnimation()
}
