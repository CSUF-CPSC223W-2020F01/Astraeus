//
//  SpaceList.swift
//  Astraeus
//
//  Created by Aaron Lieberman on 9/30/20.
//

import SwiftUI

struct PlanetList: View {
    @State private var sortSelection = SortValue.orbitDistance

    var body: some View {
        NavigationView {
            List(sortPlanetData(property: sortSelection)!) { curPlanet in
                NavigationLink(destination: PlanetView(curPlanet)) {
                    PlanetRow(planet: curPlanet)
                }
            }
            .navigationBarTitle(Text("Planets"))
            .navigationBarItems(trailing: {
                Menu {
                    Button(action: { print("Hello there") }) {
                        Picker(selection: $sortSelection, label: /*@START_MENU_TOKEN@*/Text("Picker")/*@END_MENU_TOKEN@*/) {
                            Text("Orbit Distance").tag(SortValue.orbitDistance)
                            Text("Radius").tag(SortValue.radius)
                            Text("Volume").tag(SortValue.volume)
                            Text("Mass").tag(SortValue.mass)
                            Text("Density").tag(SortValue.density)
                            Text("Gravity").tag(SortValue.gravity)
                            Text("Rotation Period").tag(SortValue.rotationPeriod)
                            Text("Orbit Period").tag(SortValue.orbitPeriod)
                            Text("Average Orbit Velocity").tag(SortValue.avgOrbitVelocity)
                            Text("Orbit Inclination").tag(SortValue.orbitInclination)
                        }
                    }
                } label: {
                    Image(systemName: "arrow.up.arrow.down")
                }

            }())
        }
    }
}

struct PlanetList_Previews: PreviewProvider {
    static var previews: some View {
        PlanetList()
    }
}
