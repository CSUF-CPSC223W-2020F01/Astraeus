//
//  SpaceEvents.swift
//  Astraeus
//
//  Created by Aaron Lieberman on 9/30/20.
//

import SwiftUI

func getEvents(_ url: String, _ arr: [RocketEvent], _ numRequests: Int, callback: @escaping ([RocketEvent]) -> Void) {
    Util.call_api(url) { res in
        var allEvents = arr
        guard let body = res else {return}
        guard let events = body["results"] as? [Any] else {return}
        for e in events {
            let event = e as! [String: Any]
            let re = RocketEvent(date: Util.stringToDate(event["date"] as! String) ?? Date(), name: event["name"] as! String, description: event["description"] as! String)
            allEvents.append(re)
        }
        if(body["next"] != nil && numRequests < 5) {
            var url = body["next"] as! String
            url.insert("s", at: url.index(url.startIndex, offsetBy: 4))
            print(url)
            getEvents(url, allEvents, numRequests + 1) {newList in
                allEvents = newList
                callback(allEvents)
            }
        } else {
            callback(allEvents)
        }
    }
}

struct EventList: View {
    @State public var eventList: [RocketEvent] = []
    let testEvent: TestEvent = TestEvent()
    let dateFormatter: DateFormatter = DateFormatter()
    
    init() {
        dateFormatter.dateStyle = .medium
    }
    
    func getData() {
        getEvents("https://spacelaunchnow.me/api/3.3.0/event/", eventList, 0) {
            eventList = $0
        }
    }
    
    var body: some View {
        NavigationView {
            List(eventList) { event in
                Section(header: Text("\(dateFormatter.string(from: event.date))")) {
                    NavigationLink(destination: EventView(event)) {
                        EventRow(event)
                    }
                }
            }
        }.navigationBarTitle(Text("Events")).onAppear(perform: getData)
    }
}

struct SpaceEvents_Previews: PreviewProvider {
    static var previews: some View {
        EventList()
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
