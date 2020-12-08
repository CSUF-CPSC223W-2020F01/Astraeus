//
//  Event.swift
//  Astraeus
//
//  Created by Aaron Lieberman on 11/30/20.
//

import Foundation

struct TestEvent2: Codable {
    var date : String
    var name : String
    var description : String
    var type : String
    
    enum CodingKeys: String, CodingKey {
        case date
        case name
        case description
        case type
    }
    
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.date = try valueContainer.decode(String.self, forKey: CodingKeys.date)
        self.name = try valueContainer.decode(String.self, forKey: CodingKeys.name)
        self.description = try valueContainer.decode(String.self, forKey: CodingKeys.description)
        self.type = try valueContainer.decode(String.self, forKey: CodingKeys.type)
    }
}

protocol Event {
    var date : Date {get}
    var name : String {get}
    var description : String {get}
    var type : String {get}
}

class TestEvent: Event {
    let date = Date()
    let name = "Test event"
    let description = "This is a test event."
    let type = "Test"
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
