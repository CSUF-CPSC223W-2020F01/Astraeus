//
//  SpaceList.swift
//  Astraeus
//
//  Created by Aaron Lieberman on 9/30/20.
//

import SwiftUI

struct PlanetList: View {
    @State private var sortSelection = sortValue.orbitDistance

    var body: some View {
        NavigationView {
            List(planetData!) { curPlanet in
                NavigationLink(destination: PlanetView(curPlanet)) {
                    PlanetRow(planet: curPlanet)
                }
            }
            .navigationBarTitle(Text("Planets"))
            .navigationBarItems(trailing: {
                Menu {
                    Button(action: { print("Hello there") }) {
                        Picker(selection: $sortSelection, label: /*@START_MENU_TOKEN@*/Text("Picker")/*@END_MENU_TOKEN@*/) {
                            Text("Orbit Distance").tag(sortValue.orbitDistance)
                            Text("Radius").tag(sortValue.radius)
                            Text("Volume").tag(sortValue.volume)
                            Text("Mass").tag(sortValue.mass)
                            Text("Density").tag(sortValue.density)
                            Text("Gravity").tag(sortValue.gravity)
                            Text("Rotation Period").tag(sortValue.rotationPeriod)
                            Text("Orbit Period").tag(sortValue.orbitPeriod)
                            Text("Average Orbit Velocity").tag(sortValue.avgOrbitVelocity)
                            Text("Orbit Inclination").tag(sortValue.orbitInclination)
                        }
                    }
                } label: {
                    Image(systemName: "arrow.up.arrow.down")
                }

            }())
        }
    }

    init() {
        if planetData != nil {
            print(planetData!)
            sortPlanetData(property: .orbitDistance)
        }
    }
}

struct PlanetList_Previews: PreviewProvider {
    static var previews: some View {
        PlanetList()
    }
}
