//
//  Event.swift
//  Astraeus
//
//  Created by Aaron Lieberman on 11/30/20.
//

import Foundation

protocol Event: Decodable, Identifiable {
    var date : Date {get}
    var name : String {get}
    var description : String {get}
    var type : String {get}
}

class RocketEvent: Event {
    var date: Date
    var name : String
    var description : String
    var type = "Defualt"
    
    init(date: Date, name: String, description: String) {
        self.date = date
        self.name = name
        self.description = description
    }
}

class TestEvent: Event {
    var date = Date()
    var name = "Test event"
    var description = "This is a test event."
    var type = "Test"
}

struct RocketEvent: Event {
    var date: Date
    var name: String
    var description: String
    var type: String
    
    init() {
        date = Util.stringToDate("2020-12-06")!
        name = "Falcon 9 • SpaceX CRS 21"
        description = "A SpaceX Falcon 9 rocket will launch a Dragon 2 spacecraft on its first cargo resupply mission to the International Space Station. The flight is the 21st mission by SpaceX conducted under the Commercial Resupply Services contract with NASA. Delayed from Aug. 5, Oct. 30, Nov. 15, Nov. 22, and Dec. 2. Delayed from Dec. 5 by poor weather in booster recovery area."
        type = "Rocket Launch"
    }
}
