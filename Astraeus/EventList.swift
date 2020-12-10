//
//  SpaceEvents.swift
//  Astraeus
//
//  Created by Aaron Lieberman on 9/30/20.
//

import SwiftUI

struct EventList: View {
    let testEvent: TestEvent
    let rocketEvent: RocketEvent
    let dateFormatter: DateFormatter
    
    init() {
        testEvent = TestEvent()
        rocketEvent = RocketEvent()
        dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
    }
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("\(dateFormatter.string(from: testEvent.date))")) {
                    NavigationLink(destination: EventView(testEvent)) {
                        EventRow(testEvent)
                    }
                }
                Section(header: Text("\(dateFormatter.string(from: rocketEvent.date))")) {
                    NavigationLink(destination: EventView(rocketEvent)) {
                        EventRow(rocketEvent)
                    }
                }
            }
            .navigationBarTitle(Text("Events"))
        }
    }
}

struct SpaceEvents_Previews: PreviewProvider {
    static var previews: some View {
        EventList()
    }
}
