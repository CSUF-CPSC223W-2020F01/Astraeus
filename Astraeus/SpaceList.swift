//
//  SpaceList.swift
//  Astraeus
//
//  Created by Aaron Lieberman on 9/30/20.
//

import SwiftUI

struct SpaceList: View {
    @State private var sortSelection = SortValue.orbitDistance
    var body: some View {
        NavigationView {
            List(planetData!) { curPlanet in
                NavigationLink(destination: SpaceDetail(curPlanet)) {
                    PlanetRow(planet: curPlanet)
                }
            }
            .navigationBarTitle(Text("Planets"))
            .navigationBarItems(trailing: {
                Menu {
                    Button(action: { sortPlanetData(property: sortSelection) }) {
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
                            Text("Surface Temperature Range").tag(SortValue.surfaceTempRange)
                        } .onChange(of: $sortSelection, perform: sortPlanetData(property: $sortSelection))
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

struct SpaceList_Previews: PreviewProvider {
    static var previews: some View {
        SpaceList()
    }
}
