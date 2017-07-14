//
//  ViewController.swift
//  TicTacToe
//
//  Created by Kaan Kabalak on 7/6/17.
//  Copyright © 2017 Kaan Kabalak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var board = [0,0,0,
                 0,0,0,
                 0,0,0]
    
    var turn = "blue"

    @IBOutlet weak var winnerLabel: UILabel!
    
    @IBOutlet var collectionOfButtons: Array<UIButton>!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        winnerLabel.isHidden = true
        for button in collectionOfButtons {
            button.backgroundColor = UIColor.lightGray
            button.isEnabled = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func resetPressed(_ sender: UIButton) {
        viewDidLoad()
        board = [0,0,0,
                 0,0,0,
                 0,0,0]
        
        turn = "blue"
        viewDidLoad()
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if(turn == "blue") {
            sender.backgroundColor = UIColor.blue
            print(sender.tag)
            board[sender.tag - 1] = 1
            sender.isEnabled = false
            print(board)
            turn = "red"
        }
        else if(turn == "red") {
            sender.backgroundColor = UIColor.red
            print(sender.tag)
            board[sender.tag - 1] = 2
            sender.isEnabled = false
            print(board)
            turn = "blue"
        }
        checkTable()
        
    }
    func checkTable() {
        for i in 0...2 {
            if(board[0+i] == 1 && board[3+i] == 1 && board[6+i] == 1) {
                winnerLabel.text = "Blue wins!"
                winnerLabel.isHidden = false
                for button in collectionOfButtons {
                    button.isEnabled = false
                }
            }
            else if(board[0+3*i] == 1 && board[1+3*i] == 1 && board[2+3*i] == 1) {
                winnerLabel.text = "Blue wins!"
                winnerLabel.isHidden = false
                for button in collectionOfButtons {
                    button.isEnabled = false
                }
            }
        }
        if( (board[0] == 1 && board[4] == 1 && board[8] == 1) || (board[2] == 1 && board[4] == 1 && board[6] == 1) ) {
            winnerLabel.text = "Blue wins!"
            winnerLabel.isHidden = false
            for button in collectionOfButtons {
                button.isEnabled = false
            }
        }
        for i in 0...2 {
            if(board[0 + i] == 2 && board[3+i] == 2 && board[6 + i] == 2) {
                winnerLabel.text = "Red wins!"
                winnerLabel.isHidden = false
                for button in collectionOfButtons {
                    button.isEnabled = false
                }
            }
            else if(board[0+3*i] == 2 && board[1+3*i] == 2 && board[2+3*i] == 2) {
                winnerLabel.text = "Red wins!"
                winnerLabel.isHidden = false
                for button in collectionOfButtons {
                    button.isEnabled = false
                }
            }
        }
        if( (board[0] == 2 && board[4] == 2 && board[8] == 2) || (board[2] == 2 && board[4] == 2 && board[6] == 2) ) {
            winnerLabel.text = "Red wins!"
            winnerLabel.isHidden = false
            for button in collectionOfButtons {
                button.isEnabled = false
            }
        }
        
    }

}

