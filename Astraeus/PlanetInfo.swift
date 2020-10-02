//
//  PlanetInfo.swift
//  Astraeus
//
//  Created by Alex on 10/2/20.
//


// Data source: https://solarsystem.nasa.gov/planet-compare/
struct PlanetInfo
{
    let orbitDistance: Int /// km
    let radius: Int /// km
    let volume: Int /// km^3
    let mass: Int /// kg
    let density: Float /// g/cm^3
    let gravity: Float /// m/s^2
    
    let rotPeriod: Float /// Earth days
    let orbitPeriod: Float /// Earth days
    let avgOrbitVel: Int /// km/h
    let orbitInclination: Float /// degrees
    
    let surfaceTempRange: (Int, Int) /// celcius; (from, to) inclusive
}
