//
//  ScrollablePickerView.swift
//  CoolUi
//
//  Created by Alexis Gadbin on 30/04/2025.
//

import SwiftUI

struct ScrollablePickerView: View {
    @State private var config: ScrollablePicker.Config = .init(count: 30)
    @State private var value: CGFloat = 0
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack(alignment: .lastTextBaseline, spacing: 5) {
                    Text(String(format: "%.1f", value))
                        .font(.largeTitle.bold())
                        .contentTransition(.numericText(value: value))
                        .animation(.snappy, value: value)
                    
                    Text("kgs")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .textScale(.secondary)
                        .foregroundStyle(.gray)
                }
                .padding(.bottom, 30)
                ScrollablePicker(config: config, value: $value)
                    .frame(height: 60)
            }
            .navigationTitle("Scrollable Picker")
        }
    }
}

#Preview {
    ScrollablePickerView()
}
