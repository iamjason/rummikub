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
  
  init () {
    
    tiles = [Tile]()
    var idIndex = 0
    
    // numberOfEachColor
    for _ in 1...2 {
      
      for color in TileColor.colors {
        for value in 1...12 {
          let tile = Tile(id:idIndex, color: color, value: value)
          addTile(tile)
          idIndex = idIndex + 1
        }
      }
      
    }
    
  }
  
  mutating func addTile(tile:Tile){
    tiles.append(tile)
  }
  
  mutating func drawTile() -> Tile? {
    let index = Int(arc4random_uniform(UInt32(tiles.count)))
    if index < tiles.count {
      let tile = tiles.removeAtIndex(index)
      return tile
    }
    
    return nil
    
  }
  
}

