//
//  PlanetInfo.swift
//  Astraeus
//
//  Created by Alex on 10/2/20.
//

import Foundation

// Data source: https://solarsystem.nasa.gov/planet-compare/
struct PlanetInfo: Decodable
{
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
    
    let surfaceTempRange: [String] /// celcius; (from, to) inclusive
    let description: String
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

func create() -> [PlanetInfo]? {
    guard let arr: [PlanetInfo] = load("Planets.json") else { return nil }
    return arr
}