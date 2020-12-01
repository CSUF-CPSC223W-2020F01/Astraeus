//
//  SpaceList.swift
//  Astraeus
//
//  Created by Aaron Lieberman on 9/30/20.
//

import SwiftUI

struct PlanetList: View {
    var body: some View {
        NavigationView {
            List(planetData!) { curPlanet in
                NavigationLink(destination: PlanetView(curPlanet)) {
                    PlanetRow(planet: curPlanet)
                }
            }
            .navigationBarTitle(Text("Planets"))
        }
    }
    init()
    {
        if planetData != nil {
            print(planetData)
        }
    }
}

struct PlanetList_Previews: PreviewProvider {
    static var previews: some View {
        PlanetList()
    }
}
