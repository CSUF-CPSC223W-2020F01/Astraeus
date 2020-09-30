//
//  SpaceList.swift
//  Astraeus
//
//  Created by Aaron Lieberman on 9/30/20.
//

import SwiftUI

struct SpaceList: View {
    var body: some View {
        VStack {
            Text("Earth")
            Text("Mars")
            Text("Venus")
            Text("Saturn")
        }
    }
}

struct SpaceList_Previews: PreviewProvider {
    static var previews: some View {
        SpaceList()
    }
}
