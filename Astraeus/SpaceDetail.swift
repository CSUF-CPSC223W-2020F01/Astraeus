//
//  SpaceDetail.swift
//  Astraeus
//
//  Created by Aaron Lieberman on 10/1/20.
//

import SwiftUI

struct SpaceDetail: View {
    var planetInfo: PlanetInfo
    
    init(_ newPlanetInfo: PlanetInfo) {
        planetInfo = newPlanetInfo
    }
    
    var body: some View {
        HStack{
             VStack(alignment: .leading, spacing: 6){
                Group {
                Text(planetInfo.name)
                    .font(.title)
                    Text("Oribital Distance: \(planetInfo.orbitDistance) km")
                    Text("Radius: \(planetInfo.radius) km")
                    Text("Volume: \(planetInfo.volume) km^3")
                    Text("Mass: \(planetInfo.mass) kg")
                    Text("Density: \(planetInfo.density) g/cm^3")
                    Text("Gravity: \(planetInfo.gravity) m/s^2")
                    Text("Rotation Period: \(planetInfo.rotationPeriod) Earth Days")
                    Text("Orbit Period: \(planetInfo.orbitPeriod) Earth Days")
                }
                Group {
                    Text("Average Orbit Velocity: \(planetInfo.avgOrbitVelocity) km/h")
                    Text("Orbit Inclination: \(planetInfo.orbitInclination) degrees")
                    Text("Surface Tempurature Range: \(planetInfo.surfaceTempRange) celcius")
                    Text("Description: \(planetInfo.description)")
                }
             }
            .frame(width: 380, alignment: .leading)
        }
    }
}


struct SpaceDetail_Previews: PreviewProvider {
    static var previews: some View {
        let planetObject : PlanetInfo = planetData![0]
        SpaceDetail(planetObject)
    }
}
