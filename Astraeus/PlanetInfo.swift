//
//  PlanetInfo.swift
//  Astraeus
//
//  Created by Alex on 10/2/20.
//

import CoreLocation
import Foundation
import SwiftUI

protocol PropertyReflectable {}

extension PropertyReflectable {
    subscript(key: String) -> Any? {
        let m = Mirror(reflecting: self)
        return m.children.first { $0.label == key }?.value
    }
}

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

extension PlanetInfo: PropertyReflectable {}

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
        print(data)
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
enum SortValue {
    case orbitDistance, radius, volume, mass, density, gravity, rotationPeriod, orbitPeriod, avgOrbitVelocity, orbitInclination, surfaceTempRange
}

// Sorting function
func sortingFunction(value1: PlanetInfo, value2: PlanetInfo) -> Bool {
    return value1.radius < value2.radius
}

// Sort the array by passing in the above sorting function
func sortPlanetData(property: SortValue) {
    var f: (PlanetInfo, PlanetInfo) -> Bool

    switch property {
    case .orbitDistance:
        f = { $0.orbitDistance < $1.orbitDistance }
    case .radius:
        f = { $0.radius < $1.radius }
    case .volume:
        f = { $0.volume < $1.volume }
    case .mass:
        // f = { $0.mass < $1.mass }
        f = { ($0.mass.count == $1.mass.count) ? $0.mass < $1.mass : $0.mass.count < $1.mass.count }
    case .density:
        f = { $0.density < $1.density }
    case .gravity:
        f = { $0.gravity < $1.gravity }
    case .rotationPeriod:
        f = { $0.rotationPeriod < $1.rotationPeriod }
    case .orbitPeriod:
        f = { $0.orbitPeriod < $1.orbitPeriod }
    case .avgOrbitVelocity:
        f = { $0.avgOrbitVelocity < $1.avgOrbitVelocity }
    case .orbitInclination:
        f = { $0.orbitInclination < $1.orbitInclination }
    case .surfaceTempRange:
        f = { $0.surfaceTempRange < $1.surfaceTempRange }
    }
    planetData?.sort(by: f)
}

struct PlanetInfo_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
