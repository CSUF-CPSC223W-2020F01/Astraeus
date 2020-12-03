//
//  EventView.swift
//  Astraeus
//
//  Created by Alex on 12/1/20.
//

import SwiftUI

struct EventView: View {
    let event: Event
    
    init(_ ev: Event) {
        event = ev
    }
    var body: some View {
        VStack {
            Text("\(event.name)")
            Text("\(event.date.description)")
            Text("\(event.description)")
            Text("\(event.type)")
        }
    }
}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        EventView(TestEvent())
    }
}
