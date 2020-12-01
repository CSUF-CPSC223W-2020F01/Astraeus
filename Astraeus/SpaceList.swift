//
//  SpaceList.swift
//  Astraeus
//
//  Created by Aaron Lieberman on 9/30/20.
//

import SwiftUI

struct SpaceList: View {
    var body: some View {
        NavigationView {
            sortPlanetData()
//            List {
//                ListItem(text: "The Sun", image: Image(systemName: "sun.max.fill"))
//                ListItem(text: "Earth", image: Image(systemName: "globe"))
//                ListItem(text: "Mars", image: Image(systemName: "m.circle.fill"))
//                ListItem(text: "Mercury", image: Image(systemName: "m.circle.fill"))
//            }.navigationBarTitle(Text("Planets"))
            
//            List {
//                NavigationLink(destination: SpaceDetail(nil)) {
//                    PlanetRow(planet: planetData![0])
//                }
//                PlanetRow(planet: planetData![1])
//                PlanetRow(planet: planetData![2])
//                PlanetRow(planet: planetData![3])
//            }
//            .navigationBarTitle(Text("Planets"))
            
            List(planetData!) { curPlanet in
                NavigationLink(destination: SpaceDetail(curPlanet)) {
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

/*struct ListItem: View {
    var text: String
    var image: Image
    var body: some View {
        NavigationLink(destination: SpaceDetail(nil)) {
            HStack {
                image.padding()
                Text(text).padding()
                Spacer()
            }
        }
    }
}*/

struct SpaceList_Previews: PreviewProvider {
    static var previews: some View {
        SpaceList()
    }
}
