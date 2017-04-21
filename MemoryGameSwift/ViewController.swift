//
//  ViewController.swift
//  MemoryGame
//
//  Created by Arslan Waheed on 4/2/17.
//  Copyright © 2017 Arslan Waheed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var firstView: UIView!
    
    @IBAction func levelSelectorButtons(_ sender: UIButton) {
        let level = sender.currentTitle
        arr = ArrayTiles(level: level!)
        firstView.isHidden = true
        gameTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runTimedCode), userInfo: nil, repeats: true)
    }
    var arr : ArrayTiles? = nil
    
    
    @IBOutlet weak var winningMessageLabel: UILabel!
    @IBOutlet weak var movesLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var bestMovesLabel: UILabel!
    @IBOutlet weak var bestTimeLabel: UILabel!
    
    var gameTimer : Timer!
    var time = 0
    var movesCount = 0
    var bestMoves : Int? = nil
    var bestTime : Int? = nil
    
    var selectedButton : UIButton? = nil
    var isSelected : Bool = false
    
    
    
    var indices1 : (Int,Int)? = nil
    var indices2 : (Int,Int)? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        winningMessageLabel.isHidden = true
        movesLabel.text = "Moves: 0"
        bestTimeLabel.text = "Best Time:"
        timeLabel.text = "Time: 0"
        bestMovesLabel.text = "Best Moves:"
        
        
    }

    
    @IBAction func imageButton(_ sender: UIButton) {
        if indices1 == nil {
            indices1 = arr?.buttonClicked(sender)
        }else {
            indices2 = arr?.buttonClicked(sender)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            if self.selectedButton == nil {
                self.selectedButton = sender
                self.movesCount += 1
                self.movesLabel.text = "Moves: \(self.movesCount)"
            }else if self.selectedButton != sender {
                if self.selectedButton?.currentTitle == sender.currentTitle {
                    sender.isHidden = true
                    self.selectedButton?.isHidden = true
                    self.arr?.matrix[(self.indices1?.0)!][(self.indices1?.1)!].isMatched = true
                    self.arr?.matrix[(self.indices2?.0)!][(self.indices2?.1)!].isMatched = true
                } else {
                    sender.setTitle("", for: .normal)
                    self.selectedButton?.setTitle("", for: .normal)
                }
                self.indices1 = nil
                self.indices2 = nil
                self.selectedButton = nil
                self.movesCount += 1
                self.movesLabel.text = "Moves: \(self.movesCount)"
            }
        }
    }
    
    func runTimedCode() {
        time += 1
        timeLabel.text = "Time: \(time)"
        if !(arr?.isRemaining())! {
            gameTimer.invalidate()
            winningMessageLabel.isHidden = false
        }
        
    }
}

