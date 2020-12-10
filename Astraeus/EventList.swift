//
//  SpaceEvents.swift
//  Astraeus
//
//  Created by Aaron Lieberman on 9/30/20.
//

import SwiftUI

let MAX_REQUESTS = 5

func getEvents(_ url: String, _ arr: [RocketEvent], _ numRequests: Int, callback: @escaping ([RocketEvent]) -> Void) {
    Util.call_api(url) { res in
        var allEvents = arr
        guard let body = res else { return }
        guard let events = body["results"] as? [Any] else { return }
        for e in events {
            print(e)
            let event = e as! [String: Any]
            let re = RocketEvent(date: Util.stringToDate(event["date"] as! String) ?? Date(), name: event["name"] as! String, description: event["description"] as! String, imageURL: event["feature_image"] as? String)
            allEvents.append(re)
        }
        if body["next"] != nil, numRequests < MAX_REQUESTS {
            var url = body["next"] as! String
            url.insert("s", at: url.index(url.startIndex, offsetBy: 4))
            print(url)
            getEvents(url, allEvents, numRequests + 1) { newList in
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
    @State var isLoading = false
    let testEvent = TestEvent()
    let dateFormatter = DateFormatter()

    init() {
        dateFormatter.dateStyle = .medium
    }

    func refreshEvents() {
        print("Loading...")
        isLoading = true
        getEvents("https://spacelaunchnow.me/api/3.3.0/event/", eventList, 0) {
            eventList = $0
            eventList.sort(by: { $0.date < $1.date })

            isLoading = false
            print("Finished loading.")
        }
    }

    var body: some View {
        NavigationView {
            List {
                if eventList.isEmpty {
                    Text(isLoading ? "Loading..." : "No events found.").italic()
                } else {
                    ForEach(eventList) { event in
                        Section(header: Text("\(dateFormatter.string(from: event.date))")) {
                            NavigationLink(destination: EventView(event)) {
                                EventRow(event)
                            }
                        }
                    }
                }
            }

            .navigationBarTitle(Text("Events"))
            .navigationBarItems(trailing: {
                Button("Refresh") {
                    refreshEvents()
                }
            }())
        }.onAppear {
            if eventList.isEmpty {
                refreshEvents()
            }
        }
    }
}

struct SpaceEvents_Previews: PreviewProvider {
    static var previews: some View {
        EventList()
    }
}
