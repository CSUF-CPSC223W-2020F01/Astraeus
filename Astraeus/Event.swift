//
//  Event.swift
//  Astraeus
//
//  Created by Aaron Lieberman on 11/30/20.
//

import Foundation

protocol Event {
    var date : Date {get}
    var name : String {get}
    var description : String {get}
    var type : String {get}
}
