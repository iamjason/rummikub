//
//  Pile.swift
//  rummikub
//
//  Created by Jason Garrett on 1/2/16.
//  Copyright © 2016 Jason Garrett. All rights reserved.
//

import Foundation

struct Pile :  CustomStringConvertible {
  var tiles:[Tile]
  var description: String  {
    return "pile-[\(tiles.map { $0.description }.joinWithSeparator(","))]-"
  }
  
  static func createPile() -> Pile {
    
    var pile = Pile(tiles: [])
    var idIndex = 0
    for color in TileColor.colors {
      for value in 1...12 {
        let tile = Tile(id:idIndex, color: color, value: value)
        pile.addTile(tile)
        idIndex = idIndex + 1
      }
    }
    return pile
    
  }
  
  mutating func addTile(tile:Tile){
    tiles.append(tile)
  }
  mutating func drawTile() -> Tile {
    let index = Int(arc4random_uniform(UInt32(tiles.count)))
    let tile = tiles.removeAtIndex(index)
    return tile
  }
}

