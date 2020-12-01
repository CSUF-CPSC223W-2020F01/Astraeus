//
//  SpaceEvents.swift
//  Astraeus
//
//  Created by Aaron Lieberman on 9/30/20.
//

import SwiftUI

struct EventList: View {
    let testEvent: TestEvent
    let dateFormatter: DateFormatter
    
    init() {
        testEvent = TestEvent()
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
