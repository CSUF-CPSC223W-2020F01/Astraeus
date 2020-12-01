//
//  EventRow.swift
//  Astraeus
//
//  Created by Alex on 12/1/20.
//

import SwiftUI

struct EventRow: View {
    let event: Event
    
    init(_ ev: Event) {
        event = ev
    }
    
    var body: some View {
        HStack {
            Text("\(event.name)")
                .padding()
            Spacer()
        }
    }
}

struct EventRow_Previews: PreviewProvider {
    static var previews: some View {
        EventRow(TestEvent())
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
