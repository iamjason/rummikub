//
//  Player.swift
//  rummikub
//
//  Created by Jason Garrett on 1/5/16.
//  Copyright © 2016 Jason Garrett. All rights reserved.
//

import Foundation

struct Player {
  
  var strategy:Strategy
  
  let name:String
  var rack:Rack
  var plays:[TileGroupPlay]
  
  var description: String  {
    return "\(name)-[\(rack)]- # of plays:\(plays.count)"
  }
  
  static func createPlayer(name:String, tiles:[Tile] = [Tile]() ) -> Player {
  
    let aStrategy = BasicStrategy()
    
    return Player(strategy:aStrategy, name:name, rack: Rack(), plays: [TileGroupPlay]())
    
  }
  
}