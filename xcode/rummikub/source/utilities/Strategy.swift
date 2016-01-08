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
  func findAllRuns(objects:[Tile]) -> [TileGroup]
  func solve(tiles:[Tile]) -> TileGroupPlay
}

/**
 The 'Basic' strategy is to play the max number of tiles each play.
 This approach doesn't take into account the possiblility of bigger future moves.
 i.e. maybe i should hold onto a piece in the set for my run later
 */
class BasicStrategy : Strategy {
  
  
  
  /**
   
   Find all run combinations
   
   */
  func findAllRuns(objects:[Tile]) -> [TileGroup] {
    
    
    var results = [TileGroup]()
    TileColor.colors.forEach { (color) in
      
      let filteredByColor = objects
        .filter { $0.color == color }
        .sort{ $0.value < $1.value }
    
      //print("filteredByColor: \(filteredByColor)")
      
      
      let allCombos = combinations(filteredByColor)
        .filter { (tiles) in
          tiles.count >= 3
        }
        .filter { (tiles) in
          
          var tmp = Set<Int>()
          for tile in tiles {
            if !tmp.contains(tile.value) {
              tmp.insert(tile.value)
            } else {
              return false
            }
          }
          return true
        }
        .map{ (tiles) in
          TileGroup(tiles:tiles)
        }
      
      results = results + allCombos
      
    }
    
    var finalResult = [TileGroup]()
    for r in results {
      if isValidRun(r.tiles) {
        finalResult.append(TileGroup(tiles: r.tiles))
      }
      
    }
    
    return finalResult.sort({ (g1, g2) -> Bool in
      g1.score > g2.score
    })
    
  }
  
  
  /**
   
   @return An array of all possible playable combinations of 'TileGroup's
   
   */
  func findGroups(tiles:[Tile]) -> [TileGroup] {
    
    var tileGroups = [TileGroup](count: 14, repeatedValue: TileGroup(tiles:[]))
    
    // count all the values and add tiles to tile group
    for tile in tiles {
      //print(">>> \(tile) - \(tile.value)" )
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
        var visitedColors = Set<TileColor>()
        for tile in counter.tiles {

          if visitedColors.contains(tile.color) {
            tmpCounter.removeTile(tile)
          }
          
          visitedColors.insert(tile.color)
          
        }
        
        return tmpCounter
        
      }
      // groups of three or 4 only
      .filter { (counter) in
        counter.tiles.count == 3 ||
          counter.tiles.count == 4
      }
    
      return result.sort { (group1, group2) -> Bool in
        group1.score > group2.score
      }
    
  }
  
  
  
  /**
   
   Find solution
   
   */
  func solve(tiles:[Tile]) -> TileGroupPlay {
    
    // combine groups + runs
    let all = findAllRuns(tiles) + findGroups(tiles)
    
    
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