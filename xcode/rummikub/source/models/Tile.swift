//
//  Tile.swift
//  rummikub
//
//  Created by Jason Garrett on 1/2/16.
//  Copyright © 2016 Jason Garrett. All rights reserved.
//

import Foundation

enum TileColor : String {
  static let colors:[TileColor] = [.Red, .Blue, .Black, Orange]
  case Red = "R"
  case Blue = "V"
  case Black = "B"
  case Orange = "O"
}

struct Tile : CustomStringConvertible, Equatable {
  let id:Int
  let color:TileColor
  let value:Int
  var description: String {return "\(color.rawValue)\(value)"}
}
func == (lhs: Tile, rhs: Tile) -> Bool {
  return lhs.id == rhs.id
  //lhs.value == rhs.value && lhs.color == rhs.color
}
func + (lhs:Tile, rhs:Tile) -> Int {
  return lhs.value + rhs.value
}
