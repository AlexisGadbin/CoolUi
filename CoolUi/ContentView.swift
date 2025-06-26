//
//  ContentView.swift
//  CoolUi
//
//  Created by Alexis Gadbin on 21/04/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    NavigationLink(destination: ButtonRevealAnimation()) {
                        Text("Button Reveal Animation")
                    }
                    
                    NavigationLink(destination: LumeWeatherAnimation()) {
                        Text("Lume Weather Animation")
                    }
                    
                    NavigationLink(destination: OnboardingView()) {
                        Text("Infinite scroll onboarding")
                    }
                    
                    NavigationLink(destination: ScrollablePickerView()) {
                        Text("Scrollable Picker")
                    }
                    
                    NavigationLink(destination: MeshGradientView()) {
                        Text("Mesh Gradient")
                    }
                    
                    //https://youtu.be/xC2alfEzwKQ?si=deRPfRD10ncNKgFp
                    //Credi: SuCodee
                    NavigationLink(destination: MorphingDotSphereView()) {
                        Text("Morphing Dot Sphere")
                    }
                }
            }
            .navigationTitle("Cool UI")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
