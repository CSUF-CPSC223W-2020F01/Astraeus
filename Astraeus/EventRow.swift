//
//  EventRow.swift
//  Astraeus
//
//  Created by Alex on 12/1/20.
//

import SwiftUI

struct EventRow: View {
    let event: RocketEvent
    
    init(_ ev: RocketEvent) {
        event = ev
    }
    
    var body: some View {
        HStack {
            Text("\(event.name)")
            Spacer()
        }
    }
}

struct EventRow_Previews: PreviewProvider {
    static var previews: some View {
        EventRow(RocketEvent(date: Date(), name: "Test", description: "Test", imageURL: nil))
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
