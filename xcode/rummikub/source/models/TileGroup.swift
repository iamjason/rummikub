//
//  TileGroup.swift
//  rummikub
//
//  Created by Jason Garrett on 1/3/16.
//  Copyright © 2016 Jason Garrett. All rights reserved.
//

import Foundation
protocol TileGroupProtocol {
  var tiles:[Tile] { get set }
}

struct TileGroup : TileGroupProtocol, CustomStringConvertible {
  
  var tiles:[Tile]
  
  var score:Int {
    return tiles.reduce(0, combine: { (total, tile) in
      total + tile.value
    })
  }
  
  var description: String {
    return "{\(tiles.map { $0.description }.joinWithSeparator(","))}"
  }
  
  mutating func addTile(tile:Tile){
    tiles.append(tile)
  }
  
  mutating func removeTile(tile:Tile){
    tiles = tiles.filter { (t) -> Bool in
      tile != t
    }
  }
  
}
