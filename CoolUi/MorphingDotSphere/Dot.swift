//
//  Dot.swift
//  CoolUi
//
//  Created by Alexis Gadbin on 24/05/2025.
//

import Foundation

struct Dot: Identifiable {
    let id = UUID()
    let randomX: Double
    let randomY: Double
    let randomZ: Double
}

func generateRandomDot() -> Dot {
    let u = Double.random(in: 0...1)
    let v = Double.random(in: 0...1)
    let theta = 2 * .pi * u
    let phi = acos(2 * v - 1)
    let r = pow(Double.random(in: 0...1), 1.0 / 3.0)
    
    let x = r * sin(phi) * cos(theta)
    let y = r * sin(phi) * sin(theta)
    let z = r * cos(phi)
    
    return Dot(randomX: x, randomY: y, randomZ: z)
}

func interpolate(from: Double, to: Double, t: Double) -> Double {
    from * (1 - t) + to * t
}


