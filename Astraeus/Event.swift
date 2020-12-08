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
