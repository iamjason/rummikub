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
  func solve(tiles:[Tile]) -> TileGroupPlay
}

/**
 The 'Basic' strategy is to play the max number of tiles each play.
 This approach doesn't take into account the possiblility of bigger future moves.
 i.e. maybe i should hold onto a piece in the set for my run later
 */
class BasicStrategy : Strategy {
  
  /**
   
   TODO: we should return all possible combinations? or just the best?
   
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
    
    // find all combinations of 3 & 4
    var allCombinations = [TileGroup]()
    tileGroups.forEach { (group) -> () in
      allCombinations = allCombinations + combinations(group.tiles).map({ (tiles) -> TileGroup in
        TileGroup(tiles: tiles)
      })
    }
    
    let result =  allCombinations
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
      // groups of three or 4 only
      .filter { (counter) in
        counter.tiles.count == 3 ||
          counter.tiles.count == 4
    }
    //.sort { $0.score > $1.score }
    
    let sortedResult = result.sort { (group1, group2) -> Bool in
      group1.score > group2.score
    }
    
    return sortedResult
    
  }
  
  
  
  /**
   
   Find solution
   
   */
  func solve(tiles:[Tile]) -> TileGroupPlay {
    
    // combine groups + runs
    let all = findGroups(tiles)
    // TODO: runs
    
    var playedTiles = Set<Tile>()
    return all.reduce(TileGroupPlay(groups:[])) { (play, group) -> TileGroupPlay in
      
      var tmpPlay = play
      
      // check if we've played any tile in the group already
      let contains = group.tiles.reduce(false, combine: { (result, tile) -> Bool in
        result || playedTiles.contains(tile)
      })
      
      // only append the group to the solution
      // if we haven't already played the tile
      if !contains {
        tmpPlay.groups.append(group)
        for tile in group.tiles {
          playedTiles.insert(tile)
        }
        
      }
      
      return tmpPlay
    }
    
  }
  
}