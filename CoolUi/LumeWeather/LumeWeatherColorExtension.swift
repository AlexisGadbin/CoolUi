//
//  ColorExtension.swift
//  CoolUi
//
//  Created by Alexis Gadbin on 24/04/2025.
//

import SwiftUI

extension Color {
    static let coldBlue = Color(red: 64 / 255.0, green: 248 / 255.0, blue: 255 / 255.0)
    static let comfortMint = Color(red: 109 / 255.0, green: 225 / 255.0, blue: 210 / 255.0)
    static let comfortGreen = Color(red: 0 / 255.0, green: 255 / 255.0, blue: 156 / 255.0)
    static let warmYellow = Color(red: 255 / 255.0, green: 186 / 255.0, blue: 23 / 255.0)
    static let hotOrange = Color(red: 255 / 255.0, green: 145 / 255.0, blue: 73 / 255.0)
    static let hotOrange2 = Color(red: 234 / 255.0, green: 115 / 255.0, blue: 0 / 255.0)
    static let hellRed = Color(red: 247 / 255.0, green: 90 / 255.0, blue: 90 / 255.0)
}

extension Double {
    var temperatureColor: Color {
        switch self {
        case ..<15: return .coldBlue
        case 15..<20: return .comfortMint
        case 20..<25: return .comfortGreen
        case 25..<30: return .warmYellow
        case 30..<35: return .hotOrange
        case 35..<40: return .hotOrange2
        default: return .hellRed
        }
    }
}
