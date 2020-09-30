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
            Ring(radius: 300)
            Ring(radius: 200)
            Circle().foregroundColor(.yellow).frame(width: 50, height: 50)
        }
    }
}

struct Ring: View {
    var radius: CGFloat
    var body: some View {
        Circle().strokeBorder(Color.black,lineWidth: 4).background(Circle().foregroundColor(Color.white)).frame(width: radius, height: radius)
    }
}

struct SpaceMap_Previews: PreviewProvider {
    static var previews: some View {
        SpaceMap()
    }
}
