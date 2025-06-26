//
//  LumeWeatherAnimation.swift
//  CoolUi
//
//  Created by Alexis Gadbin on 24/04/2025.
//

import SwiftUI

struct LumeWeatherAnimation: View {
    
    @State private var selectedCity: City?

    var body: some View {
        ZStack {
            if let city = selectedCity {
                AnimatedBarsView(values: city.temperatures)
            }

            CitySelectionView(cities: City.all, selectedCity: $selectedCity)
        }
        .background(.black)
        .onAppear {
            selectedCity = City.all.first
        }
    }
}

#Preview {
    LumeWeatherAnimation()
}
