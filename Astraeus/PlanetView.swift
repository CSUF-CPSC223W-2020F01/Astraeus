//
//  SpaceDetail.swift
//  Astraeus
//
//  Created by Aaron Lieberman on 10/1/20.
//

import SwiftUI

struct PlanetView: View {
    var planetInfo: PlanetInfo

    init(_ newPlanetInfo: PlanetInfo) {
        planetInfo = newPlanetInfo
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 6) {
                Group {
                    Image(planetInfo.name)
                        .resizable()
                        .frame(width: 200, height: 200)
                    Text(planetInfo.name)
                        .bold()
                        .font(.title)
                    Text("Description: \(planetInfo.description) \n")
                    Divider().background(Color.white)
                    Text("\nOribital Distance: \(planetInfo.orbitDistance) km")
                    Text("Radius: \(planetInfo.radius) km")
                    Text("Volume: \(planetInfo.volume) km³")
                    Text("Mass: \(planetInfo.mass) kg")
                    Text("Density: \(planetInfo.density) g/cm³")
                    Text("Gravity: \(planetInfo.gravity) m/s²")
                }
                Group {
                    Text("Rotation Period: \(planetInfo.rotationPeriod) Earth Days")
                    Text("Orbit Period: \(planetInfo.orbitPeriod) Earth Days")
                    Text("Average Orbit Velocity: \(planetInfo.avgOrbitVelocity) km/h")
                    Text("Orbit Inclination: \(planetInfo.orbitInclination) degrees")
                    Text("Surface Tempurature Range: \(planetInfo.surfaceTempRange) celcius")
                }
            }
            .frame(alignment: .leading)
        }
        .padding(.bottom).padding(.horizontal)
    }
}

struct SpaceDetail_Previews: PreviewProvider {
    static var previews: some View {
        let planetObject: PlanetInfo = planetData![0]
        PlanetView(planetObject)
            .preferredColorScheme(.dark)
    }
}
