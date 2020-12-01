//
//  ContentView.swift
//  Astraeus
//
//  Created by Aaron Lieberman on 9/24/20.
//

import SwiftUI

struct ContentView: View {
    @State var selection = 2
    var body: some View {
        TabView(selection: $selection) {
            SpaceList()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Planet List")
            }.tag(1)
            
            SpaceMap()
                .tabItem {
                    Image(systemName: "map")
                    Text("Map")
                }.tag(2)
            
            EventList()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Events")
           }.tag(3)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
