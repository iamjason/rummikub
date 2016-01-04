//
//  TileGroup.swift
//  rummikub
//
//  Created by Jason Garrett on 1/3/16.
//  Copyright © 2016 Jason Garrett. All rights reserved.
//

import Foundation

struct TileGroup : CustomStringConvertible {
  let tiles:[Tile]
  var score:Int {
    return tiles.reduce(0, combine: { (total, tile) in
      total + tile.value
    })
  }
  var description: String {
    return "{\(tiles.map { $0.description }.joinWithSeparator(","))}"
  }
}
