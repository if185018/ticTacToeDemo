//
//  ViewController.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var model = TicTacToeBrain()
    var player = Player.player1
    
    @IBOutlet var allButtons: [GameButton]!
    

    @IBAction func buttonPressed(_ sender: GameButton) {
        model.updateGameBoard(player: player, row: sender.row, col: sender.col)
       let result = model.checkGameState()
        switch result {
        case .player1wins:
            updateButtons(row: sender.row, col: sender.col, player: player)
            print("Player 1 wins!!!")
        case .player2wins :
            updateButtons(row: sender.row, col: sender.col, player: player)
            print("Player 2 wins!!!")
        case .ongoing:
            updateButtons(row: sender.row, col: sender.col, player: player)
            player.alternate()
        case .tie:
            print("TIE")
        }
    }
    
    
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
    
    func updateButtons(row: Int, col: Int, player: Player) {
        for button in allButtons {
            if button.row == row && button.col == col {
                switch player {
                case .player1:
                    button.setTitle("O", for: .normal)
                    button.isEnabled = false
                case .player2:
                    button.setTitle("X", for: .normal)
                    button.isEnabled = false
                }
            }
        }
    }
    
    
    


}

