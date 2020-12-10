//
//  PlanetRow.swift
//  Astraeus
//
//  Created by Alex on 11/8/20.
//

import SwiftUI

struct PlanetRow: View {
    let planet: PlanetInfo

    init(planet: PlanetInfo) {
        self.planet = planet
    }

    var body: some View {
        HStack {
            Image(planet.name)
                .resizable()
                .frame(width: 50, height: 50)
            Text(planet.name)
            Spacer()
        }
    }
}

struct PlanetRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PlanetRow(planet: planetData![0])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
