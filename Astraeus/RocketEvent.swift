//
//  RocketEvent.swift
//  Astraeus
//
//  Created by Alex on 12/7/20.
//

import Foundation

struct RocketEvent: Event {
    var date: Date
    
    var name: String
    
    var description: String
    
    var type: String
    
    init() {
        date = Date()
        name = "Falcon 9 • SpaceX CRS 21"
        description = "A SpaceX Falcon 9 rocket will launch a Dragon 2 spacecraft on its first cargo resupply mission to the International Space Station. The flight is the 21st mission by SpaceX conducted under the Commercial Resupply Services contract with NASA. Delayed from Aug. 5, Oct. 30, Nov. 15, Nov. 22, and Dec. 2. Delayed from Dec. 5 by poor weather in booster recovery area."
        type = "Rocket Launch"
    }
    
}
