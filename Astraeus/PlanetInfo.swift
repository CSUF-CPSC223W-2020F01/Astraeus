//
//  PlanetInfo.swift
//  Astraeus
//
//  Created by Alex on 10/2/20.
//

import CoreLocation
import Foundation
import SwiftUI

var planetData = createPlanetData()

// Data source: https://solarsystem.nasa.gov/planet-compare/
struct PlanetInfo: Decodable, Identifiable {
    var id = UUID()

    let name: String
    let orbitDistance: Int /// km
    let radius: Double /// km
    let volume: Int /// km^3
    let mass: String /// kg
    let density: Double /// g/cm^3
    let gravity: Double /// m/s^2

    let rotationPeriod: Double /// Earth days
    let orbitPeriod: Double /// Earth days
    let avgOrbitVelocity: Int /// km/h
    let orbitInclination: Double /// degrees

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

private func createPlanetData() -> [PlanetInfo]? {
    guard let arr: [PlanetInfo] = load("Planets.json") else { return nil }
    return arr
}

// Enumeration for each sorting value
enum sortValue {
    case orbitDistance, radius, volume, mass, density, gravity, rotationPeriod, orbitPeriod, avgOrbitVelocity, orbitInclination, surfaceTempRange
}

// Sort and display the array by calling passing in the sorting function
func sortPlanetData(property: sortValue) -> [PlanetInfo]? {
    var sf: (PlanetInfo, PlanetInfo) -> Bool

    switch property {
        case .orbitDistance:
            sf = { $0.orbitDistance < $1.orbitDistance }
        case .radius:
            sf = { $0.radius < $1.radius }
        case .volume:
            sf = { $0.volume < $1.volume }
        case .mass:
            sf = { ($0.mass.count == $1.mass.count) ? $0.mass < $1.mass : $0.mass.count < $1.mass.count }
        case .density:
            sf = { $0.density < $1.density }
        case .gravity:
            sf = { $0.gravity < $1.gravity }
        case .rotationPeriod:
            sf = { $0.rotationPeriod < $1.rotationPeriod }
        case .orbitPeriod:
            sf = { $0.orbitPeriod < $1.orbitPeriod }
        case .avgOrbitVelocity:
            sf = { $0.avgOrbitVelocity < $1.avgOrbitVelocity }
        case .orbitInclination:
            sf = { $0.orbitInclination < $1.orbitInclination }
        case .surfaceTempRange:
            sf = { $0.surfaceTempRange < $1.surfaceTempRange }
    }
    planetData?.sort(by: sf)
    return planetData
}

struct PlanetInfo_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
