//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by Artyom Gurbovich on 11/4/19.
//  Copyright © 2019 Artyom Gurbovich. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var appSignLabel: UILabel!
    @IBOutlet weak var gameStatusLabel: UILabel!
    @IBOutlet weak var rockSignButton: UIButton!
    @IBOutlet weak var paperSignButton: UIButton!
    @IBOutlet weak var scissorsSignButton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var gameStatsButton: UIButton!
    
    var games = 0
    var wins = 0
    var losses = 0
    var draws = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI(.start)
    }
    
    func updateUI(_ gameState: GameState) {
        UIView.animate(withDuration: 0.2, animations: {
            self.view.backgroundColor = gameState.backgroundColor
            self.gameStatusLabel.text = gameState.text
            self.gameStatusLabel.textColor = gameState.textColor
            self.playAgainButton.setTitleColor(gameState.textColor, for: .normal)
            self.playAgainButton.backgroundColor = gameState.buttonColor
            self.gameStatsButton.setTitleColor(gameState.textColor, for: .normal)
            self.gameStatsButton.backgroundColor = gameState.buttonColor
        }, completion: nil)
        
        if gameState == .start {
            appSignLabel.text = "🤖"
            playAgainButton.isHidden = true
            rockSignButton.isHidden = false
            paperSignButton.isHidden = false
            scissorsSignButton.isHidden = false
            enableButtons(true)
        }
    }
    
    func updateStats(_ gameState: GameState) {
        games += 1
        switch gameState {
        case .win:
             wins += 1
        case .lose:
             losses += 1
        default:
             draws += 1
        }
    }
    
    func play(_ playerSign: Sign) {
        let appSign = randomSign()
        let gameResult = playerSign.compare(with: appSign)
        appSignLabel.text = appSign.emoji
        enableButtons(false)
        switch playerSign {
        case .rock:
            paperSignButton.isHidden = true
            scissorsSignButton.isHidden = true
        case .paper:
            rockSignButton.isHidden = true
            scissorsSignButton.isHidden = true
        case .scissors:
            rockSignButton.isHidden = true
            paperSignButton.isHidden = true
        }
        playAgainButton.isHidden = false
        updateStats(gameResult)
        updateUI(gameResult)
    }
    
    func enableButtons(_ state: Bool) {
        rockSignButton.isEnabled = state
        paperSignButton.isEnabled = state
        scissorsSignButton.isEnabled = state
        state ? changeButtonsColor(#colorLiteral(red: 1, green: 0.7351175547, blue: 0, alpha: 0.5)) : changeButtonsColor(.clear)
    }
    
    func changeButtonsColor(_ color: UIColor) {
        rockSignButton.backgroundColor = color
        paperSignButton.backgroundColor = color
        scissorsSignButton.backgroundColor = color
    }
    
    @IBAction func rockSignTapped(_ sender: UIButton) {
        play(.rock)
    }
    
    @IBAction func paperSignTapped(_ sender: UIButton) {
        play(.paper)
    }
    
    @IBAction func scissorsSignTapped(_ sender: UIButton) {
        play(.scissors)
    }
    
    @IBAction func playAgainTapped(_ sender: UIButton) {
        updateUI(.start)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let gameStatsViewController = segue.destination as! GameStatsViewController
        gameStatsViewController.gameStatsText = "Games: \(games)\nWins: \(wins)\nLosses: \(losses)\nDraws: \(draws)\n"
    }
    
    @IBAction func gameStatsTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "segueIdentifier", sender: self)
    }
}
