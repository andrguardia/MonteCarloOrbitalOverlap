//
//  MonteCarloOrbitalOverlapTests.swift
//  MonteCarloOrbitalOverlapTests
//
//  Created by IIT Phys 440 on 2/17/23.
//

import XCTest

final class MonteCarloOrbitalOverlapTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    func testOneS() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        let bohrRadius = 0.529177210903
        let Z = 1.0
        let myWF = WaveFunction()
        
        var result = myWF.s_OrbitalWaveFunction(x: 1.0, y: 1.0, z: 1.0, xCenter: 1.0, yCenter: 1.0, zCenter: 1.0)
        var exact = 1.0/sqrt(Double.pi)*pow(Z/bohrRadius, 3.0/2.0)
        
        XCTAssertEqual(result, exact, accuracy: 1e-14)
        
        exact = 0.0
        result = myWF.s_OrbitalWaveFunction(x: 10.0, y: 10.0, z: 10.0, xCenter: 0.0, yCenter: 0.0, zCenter: 0.0)
        XCTAssertEqual(result, exact, accuracy: 1e-14)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
