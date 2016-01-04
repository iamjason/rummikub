//
//  Rack.swift
//  rummikub
//
//  Created by Jason Garrett on 1/2/16.
//  Copyright © 2016 Jason Garrett. All rights reserved.
//

import Foundation

//typealias PileTile = (pile:Pile, tile:Tile)
//typealias RackTile = (rack:Rack, tile:Tile)

struct Rack : CustomStringConvertible {
  var tiles:[Tile]
  var description: String  {
    return "rack-[\(tiles.map { $0.description }.joinWithSeparator(","))]-"
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