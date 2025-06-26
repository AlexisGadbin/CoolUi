//
//  MorphingDotAnimation.swift
//  CoolUi
//
//  Created by Alexis Gadbin on 24/05/2025.
//

import SwiftUI

struct MorphingDotAnimation: View {
    var morphAmount: Double
    var dots: [Dot]
    var centerX: Double
    var centerY: Double
    
    private let colors: [Color] = [
        .blue, .green, .purple, .pink, .orange
    ]
    private let fadeDuration: Double = 5.5
    private let waitDuration: Double = 5.0
    
    var body: some View {
        TimelineView(.animation) { timeline in
            let time = timeline.date.timeIntervalSinceReferenceDate
            let tMorph = morphAmount / 100.0
            let rotation = time * 0.5
            
            let totalCycle = fadeDuration + waitDuration
            let timeInCycle = time.truncatingRemainder(dividingBy: totalCycle)
            
            let baseColorIndex = Int(floor(time / totalCycle)) % colors.count
            let nextColorIndex = (baseColorIndex + 1) % colors.count
            
            let count = dots.count
            
            let positions = (0..<count).map { i -> (scaledX: Double, scaledY: Double, scaledZ: Double) in
                let goldenAngle = Double.pi * (3 - sqrt(5))
                let y = 1 - (Double(i) / Double(count - 1)) * 2
                let radiusAtY = sqrt(1 - y * y)
                let theta = goldenAngle * Double(i)
                
                let sphereX = radiusAtY * cos(theta)
                let sphereZ = radiusAtY * sin(theta)
                
                let x = interpolate(from: dots[i].randomX, to: sphereX, t: tMorph)
                let yPos = interpolate(from: dots[i].randomY, to: y, t: tMorph)
                let z = interpolate(from: dots[i].randomZ, to: sphereZ, t: tMorph)
                
                let chaosScale = interpolate(from: 250.0, to: 100.0, t: tMorph)
                return (x * chaosScale, yPos * chaosScale, z * chaosScale)
            }
            
            let minY = positions.map { $0.scaledY }.min() ?? 0
            let maxY = positions.map { $0.scaledY }.max() ?? 1
            
            ZStack {
                ForEach(0..<count, id: \.self) { i in
                    let pos = positions[i]
                    
                    let rotatedX = pos.scaledX * cos(rotation) - pos.scaledZ * sin(rotation)
                    let rotatedZ = pos.scaledX * sin(rotation) + pos.scaledZ * cos(rotation)
                    
                    let perspective = 300.0 / (300.0 + rotatedZ)
                    let screenX = rotatedX * perspective
                    let screenY = pos.scaledY * perspective
                    let size = max(1.0, 3 * perspective)
                    
                    let normalizedY = (pos.scaledY - minY) / (maxY - minY)
                    let delay = normalizedY * fadeDuration
                    
                    let progress = max(0.0, min(1.0, (timeInCycle - delay) / fadeDuration))
                    let color = blend(colorl: colors[baseColorIndex], color2: colors[nextColorIndex], t: progress)

                    Circle()
                        .fill(color)
                        .frame(width: size, height: size)
                        .position(x: centerX + screenX, y: centerY + screenY)
                        .opacity(0.85)
                }
            }
        }
    }
    
    private func blend(colorl: Color, color2: Color, t: Double) -> Color {
        var r1: CGFloat = 0, g1: CGFloat = 0, b1: CGFloat = 0, a1: CGFloat = 0
        var r2: CGFloat = 0, g2: CGFloat = 0, b2: CGFloat = 0, a2: CGFloat = 0
        
        UIColor(colorl).getRed(&r1, green: &g1, blue: &b1, alpha: &a1)
        UIColor(color2).getRed(&r2, green: &g2, blue: &b2, alpha: &a2)
        
        return Color(
            red: Double(r1 * (1 - t) + r2 * t),
            green: Double(g1 * (1 - t) + g2 * t),
            blue: Double(b1 * (1 - t) + b2 * t),
        )
    }
}
