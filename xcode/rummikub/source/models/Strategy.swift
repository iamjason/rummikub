//
//  Strategy.swift
//  rummikub
//
//  Created by Jason Garrett on 1/3/16.
//  Copyright © 2016 Jason Garrett. All rights reserved.
//

import Foundation

protocol Strategy {
  func findGroups(tiles:[Tile]) -> [TileGroup]
}

/**
 The 'Basic' strategy is to play the max number of tiles each play.
 This approach doesn't take into account the possiblility of bigger future moves.
 i.e. maybe i should hold onto a piece in the set for my run later
 */
class BasicStrategy : Strategy {
  
  /**
   
   @return An array of Playable 'TileGroup'
   
   */
  func findGroups(tiles:[Tile]) -> [TileGroup] {
    
    var tileGroups = [TileGroup](count: 12, repeatedValue: TileGroup(tiles:[]))
    
    // count all the values and add tiles to tile group
    for tile in tiles {
      var counter = tileGroups[tile.value]
      counter.tiles.append(tile)
      tileGroups[tile.value] = counter
    }
    
    return tileGroups
      // groups of three or larger
      .filter { (counter) in
        counter.tiles.count >= 3
      }
      // check all groups contain MAX one of each color
      .map { (counter) -> TileGroup in
        
        var tmpCounter = counter
        
        for tile in counter.tiles {
          
          let colorsTile = counter.tiles.filter({ (localTile) -> Bool in
            localTile.color == tile.color
          })
          
          if colorsTile.count > 1 {
            // TODO: for now... just remove the first element, let's assume we have a sorted array?
            // eventually take max value tile
            if let duplicateColor = colorsTile.first {
              tmpCounter.removeTile(duplicateColor)
              return tmpCounter
            }
          }
          
        }
        
        return tmpCounter
        
    }
    
  }
  
}