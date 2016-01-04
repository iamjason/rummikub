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


class BasicStrategy : Strategy {
  
  //
  struct GroupCounter {
    var count:Int = 0
    var tiles:[Tile]
  }
  

  
  //
  func findGroups(tiles:[Tile]) -> [TileGroup] {
    
    var numbersCount = [GroupCounter](count: 12, repeatedValue: GroupCounter(count: 0, tiles:[]))
    
    for tile in tiles {
      
      var counter = numbersCount[tile.value]
      counter.count = counter.count + 1
      counter.tiles.append(tile)
      numbersCount[tile.value] = counter
      
    }
    
    let results = numbersCount
      // groups of three or larger
      .filter { (counter) in
        counter.tiles.count >= 3
      }
      // filter out groups that have more than one of the same color
      //      .filter { (counter) -> Bool in
      //        if let tile = counter.tiles.first {
      //          let color = tile.color
      //          return counter.tiles.filter({ (tile) -> Bool in
      //            tile.color == color
      //          }).count < 2
      //        }
      //        return false
      //    }
      
      // map to the return type
      .map { (counter) in
        TileGroup(tiles:counter.tiles)
    }
 
    
    
    for counter in results {
      print("-- found: \(counter)")
    }
    
    return results.map { (counter) in
      TileGroup(tiles:counter.tiles)
    }
  }
  
}