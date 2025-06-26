//
//  CitySelectionView.swift
//  CoolUi
//
//  Created by Alexis Gadbin on 24/04/2025.
//

import SwiftUI

struct CitySelectionView: View {

    let cities: [City]
    @Binding var selectedCity: City?
    @Namespace private var namespace

    var body: some View {
        VStack(alignment: .leading) {
            ForEach(cities) { city in
                HStack {
                    ZStack {
                        if selectedCity == city {
                            Rectangle()
                                .frame(width: 40, height: 1)
                                .foregroundStyle(.white)
                                .matchedGeometryEffect(
                                    id: "indicator",
                                    in: namespace
                                )
                        }

                        Rectangle()
                            .frame(width: 40, height: 1)
                            .opacity(0)
                    }

                    Text(city.name)
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)

                    Spacer()
                }
                .opacity(selectedCity == city ? 1 : 0.5)
                .onTapGesture {
                    withAnimation(.snappy) {
                        selectedCity = city
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    @Previewable @State var selectedCity: City? = nil
    CitySelectionView(cities: City.all, selectedCity: $selectedCity)
        .background(.black)

}
