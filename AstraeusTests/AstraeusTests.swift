//
//  AstraeusTests.swift
//  AstraeusTests
//
//  Created by Aaron Lieberman on 9/24/20.
//

@testable import Astraeus // This imports the Astraeus swift file in the project
import XCTest // Imports the XCTest Library

// The class inherits from XCTestCase that allows you to actually run the unit tests
class AstraeusTests: XCTestCase {
    // (Can Omit) Before your unit tests starts you can setup some stuff. ex) Set up data base connection, writing to a file
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    // (Can Omit) You can set up some stuff for after the unit test runs. Ex) Disconnecting from a database
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // All tests begin with the test keyword, followed by any string
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here
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
  
    func testCreatePlanetDataFunction() throws {
        // Checks to see if function returns nil, if so, then the JSON decoder is not working properly
        XCTAssertNotNil(createPlanetData())
    }
    
    // Logic for testPlanetInfoArray()
    func containsPlanet(_ array: [PlanetInfo], _ name: String) -> Bool {
        var found = false
        
        // Iterate through the array
        for a in array {
            if a.name == name {
                found = true
            }
        }
        return found
    }
    
    func testPlanetInfoArray() throws {
        // Check to see if a specific planet name exists in the array
        // If you get nothing, then it throws an error
        
        // Creating an instance of the "arr" array
        let array = createPlanetData()
        
        // Checking to see if the array exists
        XCTAssertNotNil(array)
        
        // Unwrapping the array
        let arr = array!
        
        // Checking to see if each planet name exists
        XCTAssertTrue(containsPlanet(arr, "Mercury"))
        XCTAssertTrue(containsPlanet(arr, "Mars"))
        XCTAssertTrue(containsPlanet(arr, "Earth"))
        XCTAssertTrue(containsPlanet(arr, "Jupiter"))
        XCTAssertTrue(containsPlanet(arr, "Venus"))
        XCTAssertTrue(containsPlanet(arr, "Saturn"))
        XCTAssertTrue(containsPlanet(arr, "Uranus"))
        XCTAssertTrue(containsPlanet(arr, "Neptune"))
        XCTAssertTrue(containsPlanet(arr, "Schleptune"))
    }
    
    func testAPICallValidUrlAndResponse() throws {
        let expectation = XCTestExpectation(description: "awaiting api response")
        Util.call_api("https://jsonplaceholder.typicode.com/todos/1") {
            XCTAssertNotNil($0)
            XCTAssertEqual($0!["userId"] as! Int, 1)
            XCTAssertEqual($0!["id"] as! Int, 1)
            XCTAssertEqual($0!["title"] as! String, "delectus aut autem")
            XCTAssertEqual($0!["completed"] as! Bool, false)
            expectation.fulfill()
        }
        let result = XCTWaiter.wait(for: [expectation], timeout: 2.0)
        XCTAssertNotEqual(result, .timedOut)
        
    }
    
    func testAPICallInvalidUrl() throws {
        let expectation = XCTestExpectation(description: "awaiting api response")
        Util.call_api("invalid url") {
            XCTAssertNil($0)
            expectation.fulfill()
        }
        let result = XCTWaiter.wait(for: [expectation], timeout: 2.0)
        XCTAssertNotEqual(result, .timedOut)
    }
    
    func testAPICallInvalidJSON() throws {
        let expectation = XCTestExpectation(description: "awaiting api response")
        Util.call_api("https://raw.githubusercontent.com/chrislgarry/Apollo-11/master/Comanche055/ANGLFIND.agc") {
            XCTAssertNil($0)
            expectation.fulfill()
        }
        let result = XCTWaiter.wait(for: [expectation], timeout: 2.0)
        XCTAssertNotEqual(result, .timedOut)
    }
}
