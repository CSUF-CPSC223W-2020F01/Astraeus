//
//  AstraeusTests.swift
//  AstraeusTests
//
//  Created by Aaron Lieberman on 9/24/20.
//

import XCTest
@testable import Astraeus

class AstraeusTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testSorts() {
        let cases = SortValue.all()
        
        for curSort in cases {
            sortPlanetData(property: curSort)
            for i in 0..<planetData!.count - 1 {
                switch curSort {
                    case .orbitDistance:
                        XCTAssertLessThanOrEqual(planetData![i].orbitDistance, planetData![i + 1].orbitDistance)
                    case .radius:
                        XCTAssertLessThanOrEqual(planetData![i].radius, planetData![i + 1].radius)
                    case .volume:
                        XCTAssertLessThanOrEqual(planetData![i].volume, planetData![i + 1].volume)
                    case .mass:
                        XCTAssertEqual(Util.intsLessOrEqualTo(planetData![i].mass, planetData![i + 1].mass), true)
                    case .density:
                        XCTAssertLessThanOrEqual(planetData![i].density, planetData![i + 1].density)
                    case .gravity:
                        XCTAssertLessThanOrEqual(planetData![i].gravity, planetData![i + 1].gravity)
                    case .rotationPeriod:
                        XCTAssertLessThanOrEqual(planetData![i].rotationPeriod, planetData![i + 1].rotationPeriod)
                    case .orbitPeriod:
                        XCTAssertLessThanOrEqual(planetData![i].orbitPeriod, planetData![i + 1].orbitPeriod)
                    case .avgOrbitVelocity:
                        XCTAssertLessThanOrEqual(planetData![i].avgOrbitVelocity, planetData![i + 1].avgOrbitVelocity)
                    case .orbitInclination:
                        XCTAssertLessThanOrEqual(planetData![i].orbitInclination, planetData![i + 1].orbitInclination)
                    case .surfaceTempRange:
                        XCTAssertLessThanOrEqual(planetData![i].surfaceTempRange, planetData![i + 1].surfaceTempRange)
                }
            }
        }
    }

}
