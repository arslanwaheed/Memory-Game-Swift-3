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
        case "HARD" :
            arrayHard.shuffle()
            var count = 0
            for row in 0..<rows {
                for col in 0..<cols {
                    matrix[row][col].tileType = arrayHard[count]
                    count += 1
                    
                }
                
            }
        case "MEDIUM" :
            arrayMed.shuffle()
            var count = 0
            for row in 0..<rows {
                for col in 0..<cols {
                    matrix[row][col].tileType = arrayMed[count]
                    count += 1
                }
            }
        case "EASY" :
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
        
        switch tag {
        case 0...4 :
            sender.setTitle(self.matrix[0][(tag%5)].tileType, for: .normal)
            return (0,tag%5)
        case 5...9 :
            sender.setTitle(self.matrix[1][(tag%5)].tileType, for: .normal)
            return (1,tag%5)
        case 10...14 :
            sender.setTitle(self.matrix[2][(tag%5)].tileType, for: .normal)
            return (2,tag%5)
        case 15...19 :
            sender.setTitle(self.matrix[3][(tag%5)].tileType, for: .normal)
            return (3,tag%5)
        case 20...24 :
            sender.setTitle(self.matrix[4][(tag%5)].tileType, for: .normal)
            return (4,tag%5)
        case 25...29 :
            sender.setTitle(self.matrix[5][(tag%5)].tileType, for: .normal)
            return (5,tag%5)
        default :
            sender.isHidden = true
        }
        return nil
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

