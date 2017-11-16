//
//  BowlingGamePresentationTests.swift
//  BowlingGamePresentationTests
//
//  Created by Tudor Carare on 14/11/2017.
//  Copyright © 2017 Tudor Carare. All rights reserved.
//

/*

 RULES:
 1) Write test that fails
 2) Write code that will make the tests pass
 3) Refactor if needed
 */

import XCTest
@testable import BowlingGamePresentation

class BowlingGamePresentationTests: XCTestCase {
    
    private var g: Game!
    
    override func setUp() {
        super.setUp()
        g = Game()
    }
    
    override func tearDown() {
        g = nil
        super.tearDown()
    }

    fileprivate func rollMany(_ n: Int, _ pins: Int) {
        for _ in 0..<n {
            g.roll(pins)
        }
    }
   
    fileprivate func rollSpare() {
        g.roll(5)
        g.roll(5)
    }
    
    fileprivate func rollStrike() {
        g.roll(10)
    }
    
    func testGutterGame() {
        rollMany(20, 0)
        
        XCTAssertEqual(g.score, 0)
    }
    
    func testAllOnes() {
        rollMany(20, 1)
        
        XCTAssertEqual(g.score, 20)
    }
    
    func testOneSpare() {
        rollSpare()
        g.roll(3)
        rollMany(17, 0)
        
        XCTAssertEqual(g.score, 16)
    }
    
    func testOneStrike() {
        rollStrike()
        g.roll(3)
        g.roll(4)
        rollMany(17, 0)
        
        XCTAssertEqual(g.score, 24)
    }
    
    func testPerfectGame() {
        rollMany(12, 10)
        
        XCTAssertEqual(g.score, 300)
    }
}
