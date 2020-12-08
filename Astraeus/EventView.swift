//
//  EventView.swift
//  Astraeus
//
//  Created by Alex on 12/1/20.
//

import SwiftUI

struct EventView: View {
    let event: RocketEvent
    
    init(_ ev: RocketEvent) {
        event = ev
    }
    var body: some View {
        ScrollView {
            HStack {
                VStack(alignment: .leading, spacing: 6) {
                    Text(event.type)
                        .bold()
                        .font(.title)
                    Text("\(event.name)")
                    Text("Description")
                        .bold()
                        .font(.title)
                    Text("\(event.date)")
                    Text("\(event.description)")
                }
                Spacer()
            }
            
        }
        .padding()
    }
}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        EventView(RocketEvent(date: Date(), name: "Test", description: "Test"))
                    .previewLayout(.fixed(width: 300, height: 70))
    }
}
