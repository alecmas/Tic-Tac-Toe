//
//  ViewController.swift
//  TicTacToe
//
//  Created by Alec Mas on 12/13/16.
//  Copyright © 2016 AMP. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var winnerLabel: UILabel!
    @IBOutlet var playAgainButton: UIButton!
    @IBOutlet var board: UIImageView!
    
    // X & O image buttons
    @IBOutlet var topLeftImg: UIButton!
    @IBOutlet var topMidImg: UIButton!
    @IBOutlet var topRightImg: UIButton!
    @IBOutlet var midLeftImg: UIButton!
    @IBOutlet var midMidImg: UIButton!
    @IBOutlet var midRightImg: UIButton!
    @IBOutlet var bottomLeftImg: UIButton!
    @IBOutlet var bottomMidImg: UIButton!
    @IBOutlet var bottomRightImg: UIButton!
    
    // function to reset the game
    @IBAction func playAgain(_ sender: AnyObject) {
        moves = 0;
        activeGame = true
        
        // 1 is circle, 2 is x
        activePlayer = 1
        // 0 is empty, 1 is circle, 2 is x
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
        for i in 1..<10 {
            if let button = view.viewWithTag(i) as? UIButton {
                button.setImage(nil, for: [])
            }
        }
        
        winnerLabel.isHidden = true
        playAgainButton.isHidden = true
        board.alpha = 1
        
        // set X & O image visibility
        topLeftImg.alpha = 1
        topMidImg.alpha = 1
        topRightImg.alpha = 1
        midLeftImg.alpha = 1
        midMidImg.alpha = 1
        midRightImg.alpha = 1
        bottomLeftImg.alpha = 1
        bottomMidImg.alpha = 1
        bottomRightImg.alpha = 1
        
        winnerLabel.center = CGPoint(x: winnerLabel.center.x - 500, y: winnerLabel.center.y)
        
        playAgainButton.center = CGPoint(x: playAgainButton.center.x - 500, y: playAgainButton.center.y)
    }
    
    var moves = 0;
    var activeGame = true
    
    // 1 is circle, 2 is x
    var activePlayer = 1
    // 0 is empty, 1 is circle, 2 is x
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    let winningCombos = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    
    @IBAction func buttonPressed(_ sender: AnyObject) {
        moves += 1
        
        let activePosition = sender.tag - 1
        
        if gameState[activePosition] == 0 && activeGame == true {
            gameState[activePosition] = activePlayer
            
            if (activePlayer == 1) {
                sender.setImage(UIImage(named: "nought.png"), for: [])
                activePlayer = 2;
                
            } else {
                sender.setImage(UIImage(named: "cross.png"), for: [])
                activePlayer = 1;
            }
            
            for combo in winningCombos {
                // check if someone has won
                if gameState[combo[0]] != 0 && gameState[combo[0]] == gameState[combo[1]] && gameState[combo[1]] == gameState[combo[2]] {
                    activeGame = false
                    
                    winnerLabel.isHidden = false
                    playAgainButton.isHidden = false
                    
                    if gameState[combo[0]] == 1 {
                        winnerLabel.text = "Team O won!"
                    } else {
                        winnerLabel.text = "Team X won!"
                    }
                    
                    UIView.animate(withDuration: 1, animations: {
                        self.winnerLabel.center = CGPoint(x: self.winnerLabel.center.x + 500, y: self.winnerLabel.center.y)
                        self.playAgainButton.center = CGPoint(x: self.playAgainButton.center.x + 500, y: self.playAgainButton.center.y)
                        self.board.alpha = 0.05
                        
                        self.topLeftImg.alpha = 0.05
                        self.topMidImg.alpha = 0.05
                        self.topRightImg.alpha = 0.05
                        self.midLeftImg.alpha = 0.05
                        self.midMidImg.alpha = 0.1
                        self.midRightImg.alpha = 0.05
                        self.bottomLeftImg.alpha = 0.05
                        self.bottomMidImg.alpha = 0.05
                        self.bottomRightImg.alpha = 0.05
                    })
                }
            }
            
            // tie game
            if (moves == 9 && activeGame == true) {
                activeGame = false
            
                winnerLabel.isHidden = false
                playAgainButton.isHidden = false
            
                winnerLabel.text = "Cat!"
            
                UIView.animate(withDuration: 1, animations: {
                    self.winnerLabel.center = CGPoint(x: self.winnerLabel.center.x + 500, y: self.winnerLabel.center.y)
                    self.playAgainButton.center = CGPoint(x: self.playAgainButton.center.x + 500, y: self.playAgainButton.center.y)
                    self.board.alpha = 0.05
                    
                    self.topLeftImg.alpha = 0.05
                    self.topMidImg.alpha = 0.05
                    self.topRightImg.alpha = 0.05
                    self.midLeftImg.alpha = 0.05
                    self.midMidImg.alpha = 0.05
                    self.midRightImg.alpha = 0.05
                    self.bottomLeftImg.alpha = 0.05
                    self.bottomMidImg.alpha = 0.05
                    self.bottomRightImg.alpha = 0.05
                })
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        winnerLabel.isHidden = true
        playAgainButton.isHidden = true
        
        winnerLabel.center = CGPoint(x: winnerLabel.center.x - 500, y: winnerLabel.center.y)
        
        playAgainButton.center = CGPoint(x: playAgainButton.center.x - 500, y: playAgainButton.center.y)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

