//
//  GameStatsViewController.swift
//  RockPaperScissors
//
//  Created by Artyom Gurbovich on 11/9/19.
//  Copyright © 2019 Artyom Gurbovich. All rights reserved.
//

import UIKit

class GameStatsViewController: UIViewController {

    @IBOutlet weak var gameStatsLabel: UILabel!
    
    var gameStatsText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameStatsLabel.text = gameStatsText
    }
    
    @IBAction func backTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
