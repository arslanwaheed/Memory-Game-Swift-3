//
//  ArrayTiles.swift
//  MemoryGame
//
//  Created by Arslan Waheed on 4/2/17.
//  Copyright © 2017 Arslan Waheed. All rights reserved.
//

import Foundation
import UIKit

//👻🙊🐴🐳🐘🐿☠️😀🤡🦊🐶🐣⚽️🚜🦁

class ArrayTiles{
    let cols = 5
    let rows = 6

    var matrix : [[Tile]] = [[Tile(),Tile(),Tile(),Tile(),Tile()],
                             [Tile(),Tile(),Tile(),Tile(),Tile()],
                             [Tile(),Tile(),Tile(),Tile(),Tile()],
                             [Tile(),Tile(),Tile(),Tile(),Tile()],
                             [Tile(),Tile(),Tile(),Tile(),Tile()],
                             [Tile(),Tile(),Tile(),Tile(),Tile()]]
    
    var arrayHard : [String] = ["😀","😀","👻","👻","🙊",
                                "🙊","🐴","🐴","🐳","🐳",
                                "🐘","🐘","🐿","🐿","☠️",
                                "☠️","🤡","🤡","🦊","🦊",
                                "🐶","🐶","🐣","🐣","🚜",
                                "🚜","⚽️","⚽️","🦁","🦁"]
    
    var arrayMed : [String] = ["😀","😀","😀","😀","👻",
                               "👻","👻","👻","🙊","🙊",
                               "🙊","🙊","🐴","🐴","🐴",
                               "🐴","🦊","🦊","🦊","🦊",
                               "🐳","🐳","🐳","🐳","🐘",
                               "🐘","🐘","🐘","🐿","🐿",]
    
    var arrayEasy : [String] = ["😀","😀","😀","😀","😀",
                                "😀","👻","👻","👻","👻",
                                "👻","👻","🙊","🙊","🙊",
                                "🙊","🙊","🙊","🐴","🐴",
                                "🐴","🐴","🐴","🐴","🦊",
                                "🦊","🦊","🦊","🦊","🦊",]
    
    init(level : String) {
        
        switch level {
        case "hard" :
            arrayHard.shuffle()
            var count = 0
            for row in 0..<rows {
                for col in 0..<cols {
                    matrix[row][col].tileType = arrayHard[count]
                    count += 1
                    
                }
                
            }
        case "medium" :
            arrayMed.shuffle()
            var count = 0
            for row in 0..<rows {
                for col in 0..<cols {
                    matrix[row][col].tileType = arrayMed[count]
                    count += 1
                }
            }
        case "easy" :
            arrayEasy.shuffle()
            var count = 0
            for row in 0..<rows {
                for col in 0..<cols {
                    matrix[row][col].tileType = arrayEasy[count]
                    count += 1
                    
                }
            }
            
        default:
            arrayEasy.shuffle()
            var count = 0
            for row in 0..<rows {
                for col in 0..<cols {
                    matrix[row][col].tileType = arrayEasy[count]
                    count += 1
                }
            }
        }
    }
    
    func isRemaining() -> Bool {
        for row in 0..<rows {
            for col in 0..<cols {
                if !self.matrix[row][col].isMatched {
                    return true
                }
            }
        }

        return false

    }
 
    func buttonClicked(_ sender : UIButton) -> (Int,Int)? {
        let tag = sender.tag
        let row : Int = tag / 5
        let col : Int = tag % 5
        
        sender.setTitle(self.matrix[row][col].tileType, for: .normal)
        return (row,col)
    }
 
}

extension Array
{
    /** Randomizes the order of an array's elements. Downloaded from Stackoverflow*/
    mutating func shuffle()
    {
        for _ in 0..<30
        {
            sort { (_,_) in arc4random() < arc4random() }
        }
    }
}

