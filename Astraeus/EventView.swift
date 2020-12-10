//
//  EventView.swift
//  Astraeus
//
//  Created by Alex on 12/1/20.
//

import SwiftUI

struct EventView: View {
    let event: Event
    let dateFormatter: DateFormatter
    
    init(_ ev: Event) {
        event = ev
        dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
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
                    Text("\(dateFormatter.string(from: event.date))")
                    Text("\(event.description)")
                }
                Spacer()
            }
            
        }
        .padding(.horizontal)
    }
}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        EventView(RocketEvent())
    }
}
