//
//  ContentView.swift
//  Astraeus
//
//  Created by Aaron Lieberman on 9/24/20.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        TabView {
            SpaceList()
                .tabItem {
                    Image(systemName: "line.horizontal.3")
                    Text("List")
            }.tag(1)
            
            SpaceMap()
                .tabItem {
                    Image(systemName: "map")
                    Text("Map")
            }.tag(2)
            
            SpaceCalendar()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Calendar")
           }.tag(3)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
