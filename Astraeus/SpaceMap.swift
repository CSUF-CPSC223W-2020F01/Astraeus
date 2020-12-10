//
//  SpaceMap.swift
//  Astraeus
//
//  Created by Aaron Lieberman on 9/30/20.
//

import SwiftUI

struct SpaceMap: View {
    var body: some View {
        ZStack {
            // Ring(radius: 200)
            Circle().foregroundColor(.yellow).frame(width: 50, height: 50)
            OrbitalView(radius: 20, orbitRadius: 57, color: .gray, rotationSpeed: 0.24)
            OrbitalView(radius: 20, orbitRadius: 108, color: .red, rotationSpeed: 0.61)
            OrbitalView(radius: 20, orbitRadius: 149, color: .green, rotationSpeed: 1)
        }
    }
}

struct Ring: View {
    var radius: CGFloat
    var body: some View {
        Circle().strokeBorder(Color.gray, lineWidth: 4).background(Circle().foregroundColor(Color.clear)).frame(width: radius, height: radius)
    }
}

struct OrbitalView: View {
    var radius: CGFloat
    var orbitRadius: CGFloat
    var color: Color
    var rotationSpeed: Double
    @State private var degree = Angle(degrees: 0)
    var animation: Animation { Animation.linear(duration: rotationSpeed * 15).repeatForever(autoreverses: false) }
    var body: some View {
        Circle()
            .foregroundColor(color)
            .frame(width: radius, height: radius)
            .position(x: UIScreen.main.bounds.size.width/2, y: UIScreen.main.bounds.size.height/2 + (orbitRadius * 0.6))
            .onAppear(perform: {
                withAnimation(self.animation) {
                    degree = Angle(degrees: 360)
                }
            }).rotationEffect(degree, anchor: .center)
    }
}

struct SpaceMap_Previews: PreviewProvider {
    static var previews: some View {
        SpaceMap()
    }
}
