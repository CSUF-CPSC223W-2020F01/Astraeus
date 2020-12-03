//
//  SpaceCalendar.swift
//  Astraeus
//
//  Created by Aaron Lieberman on 9/30/20.
//

import SwiftUI

struct SpaceEvents: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("March 29, 2021")) {
                    Text("Calendar")
                }
                
            }
        }
    }
}

struct SpaceCalendar_Previews: PreviewProvider {
    static var previews: some View {
        SpaceEvents()
    }
}
