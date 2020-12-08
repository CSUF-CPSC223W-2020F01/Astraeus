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
