//
//  PlanetInfo.swift
//  Astraeus
//
//  Created by Alex on 10/2/20.
//

import Foundation
import SwiftUI
import CoreLocation

var planetData = createPlanetData()

// Data source: https://solarsystem.nasa.gov/planet-compare/
struct PlanetInfo: Decodable, Identifiable
{
    var id = UUID()
    
    let name: String
    let orbitDistance: String /// km
    let radius: String /// km
    let volume: String /// km^3
    let mass: String /// kg
    let density: String /// g/cm^3
    let gravity: String /// m/s^2
    
    let rotationPeriod: String /// Earth days
    let orbitPeriod: String /// Earth days
    let avgOrbitVelocity: String /// km/h
    let orbitInclination: String /// degrees
    
    let surfaceTempRange: String /// celcius; (from, to) inclusive
    let description: String
    
    private enum CodingKeys: String, CodingKey {
        case name
        case orbitDistance
        case radius
        case volume
        case mass
        case density
        case gravity
        case rotationPeriod
        case orbitPeriod
        case avgOrbitVelocity
        case orbitInclination
        case surfaceTempRange
        case description
    }
}

extension PlanetInfo {
    var image: UIImage {
        return UIImage(named: name)!
    }
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

fileprivate func createPlanetData() -> [PlanetInfo]? {
    guard let arr: [PlanetInfo] = load("Planets.json") else { return nil }
    return arr
}

// Enumeration for each sorting value
enum sortValue{
    case orbitDistance, radius, volume, mass, density, gravity, rotationPeriod, orbitPeriod, avgOrbitVelocity, orbitInclination, surfaceTempRange
}

// Sorting function
func sortingFunction (value1: PlanetInfo, value2: PlanetInfo) -> Bool {
    return value1.orbitDistance < value2.orbitDistance
}

// Sort and display the array by calling passing in the sorting function
func sortPlanetData () {
    planetData?.sort(by: sortingFunction)
    }

struct PlanetInfo_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
