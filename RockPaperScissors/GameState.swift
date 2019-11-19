//
//  GameState.swift
//  RockPaperScissors
//
//  Created by Artyom Gurbovich on 11/4/19.
//  Copyright © 2019 Artyom Gurbovich. All rights reserved.
//

import UIKit

enum GameState {
    case start, win, lose, draw
    
    var text: String {
        switch self {
        case .start:
            return "Rock, Paper, Scissors?"
        case .win:
            return "You Won!"
        case .lose:
            return "You Lose!"
        case .draw:
            return "Draw!"
        }
    }
    
    var backgroundColor: UIColor {
        switch self {
        case .start:
            return #colorLiteral(red: 0.898299956, green: 0.898299956, blue: 0.898299956, alpha: 1)
        case .win:
            return #colorLiteral(red: 0.750529264, green: 0.9037466989, blue: 0.6764426698, alpha: 1)
        case .lose:
            return #colorLiteral(red: 0.9028939261, green: 0.7142608582, blue: 0.6777168702, alpha: 1)
        case .draw:
            return #colorLiteral(red: 0.6709820286, green: 0.8225273135, blue: 0.898299956, alpha: 1)
        }
    }
    
    var textColor: UIColor {
        switch self {
        case .start:
            return #colorLiteral(red: 0.402481294, green: 0.402481294, blue: 0.402481294, alpha: 1)
        case .win:
            return #colorLiteral(red: 0.2023875784, green: 0.5968309859, blue: 0, alpha: 1)
        case .lose:
            return #colorLiteral(red: 0.5994993398, green: 0.1033118835, blue: 0, alpha: 1)
        case .draw:
            return #colorLiteral(red: 0, green: 0.3997029048, blue: 0.5995543574, alpha: 1)
        }
    }
    
    var buttonColor: UIColor {
        switch self {
        case .start:
            return #colorLiteral(red: 0.6012048855, green: 0.6012048855, blue: 0.6012048855, alpha: 0.2452134683)
        case .win:
            return #colorLiteral(red: 0.2023875784, green: 0.5968309859, blue: 0, alpha: 0.2530809859)
        case .lose:
            return #colorLiteral(red: 0.5994993398, green: 0.1033118835, blue: 0, alpha: 0.2457086268)
        case .draw:
            return #colorLiteral(red: 0, green: 0.3997029048, blue: 0.5995543574, alpha: 0.2515129842)
        }
    }
}
