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
                VStack(alignment: .leading) {
                    Text("\(event.name)")
                        .bold()
                    Text("Time")
                        .font(.title2)
                        .bold()
                    Text("\(event.date)")
                    Text("Description")
                        .font(.title2)
                        .bold()
                    Text("\(event.description)")
                }
                Spacer()
            }
        }
        .navigationTitle(event.type)
        .padding(.bottom).padding(.horizontal)
    }
}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        EventView(RocketEvent(date: Date(), name: "Test", description: "Test", imageURL: nil))
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
