//
//  Game.swift
//  BowlingGamePresentation
//
//  Created by Tudor Carare on 14/11/2017.
//  Copyright © 2017 Tudor Carare. All rights reserved.
//

import Foundation

public class Game {
    
    private var rolls: [Int] = []
    
    public func roll(_ pins: Int) {
        rolls.append(pins)
    }

    public var score: Int {
        var s = 0
        var firstInFrame = 0
        for _ in 0..<10 {
            if isStrike(firstInFrame) {
                s += 10 + strikeBonus(firstInFrame)
                firstInFrame += 1
            } else if isSpare(firstInFrame) {
                s += 10 + spareBonus(firstInFrame)
                firstInFrame += 2
            } else {
                s += scoreForFrame(firstInFrame)
                firstInFrame += 2
            }
        }
        
        return s
    }

    fileprivate func scoreForFrame(_ firstInFrame: Int) -> Int {
        return rolls[firstInFrame] + rolls[firstInFrame+1]
    }
    
    fileprivate func strikeBonus(_ firstInFrame: Int) -> Int {
        return rolls[firstInFrame+1] + rolls[firstInFrame+2]
    }
    
    fileprivate func spareBonus(_ firstInFrame: Int) -> Int {
        return rolls[firstInFrame+2]
    }
    
    fileprivate func isSpare(_ firstInFrame: Int) -> Bool {
        return rolls[firstInFrame] + rolls[firstInFrame+1] == 10
    }

    fileprivate func isStrike(_ firstInFrame: Int) -> Bool {
        return rolls[firstInFrame] == 10
    }
}
