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
            List {
                ListItem(text: "The Sun", image: Image(systemName: "sun.max.fill"))
                ListItem(text: "Earth", image: Image(systemName: "globe"))
                ListItem(text: "Mars", image: Image(systemName: "m.circle.fill"))
                ListItem(text: "Mercury", image: Image(systemName: "m.circle.fill"))
            }.navigationBarTitle(Text("Planets"))
        }
    }
    init()
    {
        if let arr = create() {
            print(arr)
        }
    }
}

struct ListItem: View {
    var text: String
    var image: Image
    var body: some View {
        NavigationLink(destination: SpaceDetail()) {
            HStack {
                image.padding()
                Text(text).padding()
                Spacer()
            }
        }
    }
}

struct SpaceList_Previews: PreviewProvider {
    static var previews: some View {
        SpaceList()
    }
}
