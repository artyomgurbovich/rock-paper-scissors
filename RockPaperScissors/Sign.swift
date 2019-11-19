//
//  Sign.swift
//  RockPaperScissors
//
//  Created by Artyom Gurbovich on 11/4/19.
//  Copyright © 2019 Artyom Gurbovich. All rights reserved.
//

import Foundation
import GameplayKit

let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)

enum Sign {
    case rock, paper, scissors
    
    var emoji: String {
        switch self {
        case .rock:
            return "👊"
        case .paper:
            return "✋"
        case .scissors:
            return "✌️"
        }
    }
    
    func compare(with sign: Sign) -> GameState {
        if self == .rock && sign == .scissors {
            return .win
        } else if self == .scissors && sign == .paper {
            return .win
        } else if self == .paper && sign == .rock {
            return .win
        } else if self == sign {
            return .draw
        } else {
            return .lose
        }
    }
}

func randomSign() -> Sign {
    let sign = randomChoice.nextInt()
    if sign == 0 {
        return .rock
    } else if sign == 1 {
        return .paper
    } else {
        return .scissors
    }
}
