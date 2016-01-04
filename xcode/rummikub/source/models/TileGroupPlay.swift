//
//  TileGroupPlay.swift
//  rummikub
//
//  Created by Jason Garrett on 1/3/16.
//  Copyright © 2016 Jason Garrett. All rights reserved.
//

import Foundation

struct TileGroupPlay : CustomStringConvertible {
  
  let groups:[TileGroup]
  
  // total number to tiles in the play
  var totalTiles:Int {
    return groups.reduce(0, combine: { (total, group) in
      total + group.tiles.reduce(0, combine: { (subtotal, tile) in
        subtotal + 1
      })
    })
  }
  
  // total value of the tiles in the play
  var score:Int {
    return groups.reduce(0, combine: { (total, group) in
      total + group.score
    })
  }
  
  var description: String {
    let str = groups.map { $0.description }.joinWithSeparator(",")
    return "<\(str) score:\(score)>"
  }
  
}