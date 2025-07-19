//
//  RiveButtonView.swift
//  CoolUi
//
//  Created by Alexis Gadbin on 19/07/2025.
//

import SwiftUI
import RiveRuntime

struct RiveButtonView: View {
    var body: some View {
        // Le hover ne marche pas car nous somme sur téléphone :)
        RiveViewModel(fileName: "tuto_rive").view()
    }
}

#Preview {
    RiveButtonView()
}
