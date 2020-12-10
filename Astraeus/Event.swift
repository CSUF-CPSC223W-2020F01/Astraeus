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
    var imageURL : String? {get}
}

class RocketEvent: Event {
    var date: Date
    var name : String
    var imageURL : String?
    var description : String
    var type = "Rocket Mission"
    
    init(date: Date, name: String, description: String, imageURL: String?) {
        self.date = date
        self.name = name
        self.description = description
        self.imageURL = imageURL
    }
    init() {
        date = Date()
        name = "Falcon 9 • SpaceX CRS 21"
        description = "A SpaceX Falcon 9 rocket will launch a Dragon 2 spacecraft on its first cargo resupply mission to the International Space Station. The flight is the 21st mission by SpaceX conducted under the Commercial Resupply Services contract with NASA. Delayed from Aug. 5, Oct. 30, Nov. 15, Nov. 22, and Dec. 2. Delayed from Dec. 5 by poor weather in booster recovery area."
    }
}

class TestEvent: Event {
    var date = Date()
    var name = "Test event"
    var description = "This is a test event."
    var type = "Test type"
    var imageURL: String? = "https://user-images.githubusercontent.com/194400/49531010-48dad180-f8b1-11e8-8d89-1e61320e1d82.png"
}
