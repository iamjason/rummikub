//
//  TestTiles.swift
//  rummikub
//
//  Created by Jason Garrett on 1/3/16.
//  Copyright © 2016 Jason Garrett. All rights reserved.
//

import Foundation

struct TestTiles {
  
  let redRunOf4 = [
    Tile(id:1, color: .Red, value:1),
    Tile(id:2, color: .Red, value:2),
    Tile(id:3, color: .Red, value:3),
    Tile(id:3, color: .Red, value:4)
  ]
  
  
  
  // - MARK: edge/invalid cases
  
  let onesGroupOf4_invalid_two_red_tiles =
  [
    Tile(id:1, color: .Red, value:1),
    Tile(id:2, color: .Blue, value:1),
    Tile(id:3, color: .Orange, value:1),
    Tile(id:4, color: .Red, value:1)
  ]
  
  
  let twosGroupOf4_invalid_two_red_tiles =
  [
    Tile(id:1, color: .Red, value:2),
    Tile(id:2, color: .Blue, value:2),
    Tile(id:3, color: .Orange, value:2),
    Tile(id:4, color: .Red, value:2)
  ]
  
  
  // - MARK: groups of 4
  let onesGroupOf4 =
  [
    Tile(id:1, color: .Red, value:1),
    Tile(id:2, color: .Blue, value:1),
    Tile(id:3, color: .Orange, value:1),
    Tile(id:4, color: .Black, value:1)
  ]
  
  let twosGroupOf4 =
  [
    Tile(id:21, color: .Red, value:2),
    Tile(id:22, color: .Blue, value:2),
    Tile(id:23, color: .Orange, value:2),
    Tile(id:24, color: .Black, value:2)
  ]
  
  let threesGroupOf4 =
  [
    Tile(id:31, color: .Red, value:3),
    Tile(id:32, color: .Blue, value:3),
    Tile(id:33, color: .Orange, value:3),
    Tile(id:34, color: .Black, value:3)
  ]
  
  let fivesGroupOf4 =
  [
    Tile(id:51, color: .Red, value:5),
    Tile(id:52, color: .Blue, value:5),
    Tile(id:53, color: .Orange, value:5),
    Tile(id:54, color: .Black, value:5)
  ]
  
  let sixesGroupOf4 =
  [
    Tile(id:61, color: .Red, value:6),
    Tile(id:62, color: .Blue, value:6),
    Tile(id:63, color: .Orange, value:6),
    Tile(id:74, color: .Black, value:6)
  ]
  
  let sevensGroupOf4 =
  [
    Tile(id:71, color: .Red, value:7),
    Tile(id:72, color: .Blue, value:7),
    Tile(id:73, color: .Orange, value:7),
    Tile(id:74, color: .Black, value:7)
  ]
  
  let eightsGroupOf4 =
  [
    Tile(id:81, color: .Red, value:8),
    Tile(id:82, color: .Blue, value:8),
    Tile(id:83, color: .Orange, value:8),
    Tile(id:84, color: .Black, value:8)
  ]
  
  let ninesGroupOf4 =
  [
    Tile(id:91, color: .Red, value:9),
    Tile(id:92, color: .Blue, value:9),
    Tile(id:93, color: .Orange, value:9),
    Tile(id:94, color: .Black, value:9)
  ]
  
  let tensGroupOf4 =
  [
    Tile(id:101, color: .Red, value:10),
    Tile(id:102, color: .Blue, value:10),
    Tile(id:103, color: .Orange, value:10),
    Tile(id:104, color: .Black, value:10)
    
  ]
  
  let elevensGroupOf4 =
  [
    Tile(id:111, color: .Red, value:11),
    Tile(id:112, color: .Blue, value:11),
    Tile(id:113, color: .Orange, value:11),
    Tile(id:114, color: .Black, value:11)
  ]
  
  let twelvesGroupOf4 =
  [
    Tile(id:121, color: .Red, value:12),
    Tile(id:122, color: .Blue, value:12),
    Tile(id:123, color: .Orange, value:12),
    Tile(id:124, color: .Black, value:12)
  ]
  
  
  
  // - MARK: groups of 3
  let onesGroupOf3 =
  [
    Tile(id:1, color: .Red, value:1),
    Tile(id:2, color: .Blue, value:1),
    Tile(id:3, color: .Orange, value:1)
  ]
  
  let twosGroupOf3 =
  [
    Tile(id:21, color: .Red, value:2),
    Tile(id:22, color: .Blue, value:2),
    Tile(id:23, color: .Orange, value:2)
  ]
  
  let threesGroupOf3 =
  [
    Tile(id:31, color: .Red, value:3),
    Tile(id:32, color: .Blue, value:3),
    Tile(id:33, color: .Orange, value:3)
  ]
  
  let foursGroupOf3 =
  [
    Tile(id:41, color: .Red, value:4),
    Tile(id:42, color: .Blue, value:4),
    Tile(id:43, color: .Orange, value:4)
  ]
  
  
  let fivesGroupOf3 =
  [
    Tile(id:51, color: .Red, value:5),
    Tile(id:52, color: .Blue, value:5),
    Tile(id:53, color: .Orange, value:5)
  ]
  
  let sixesGroupOf3 =
  [
    Tile(id:61, color: .Red, value:6),
    Tile(id:62, color: .Blue, value:6),
    Tile(id:63, color: .Orange, value:6)
  ]
  
  let sevensGroupOf3 =
  [
    Tile(id:71, color: .Red, value:7),
    Tile(id:72, color: .Blue, value:7),
    Tile(id:73, color: .Orange, value:7)
  ]
  
  let eightsGroupOf3 =
  [
    Tile(id:81, color: .Red, value:8),
    Tile(id:82, color: .Blue, value:8),
    Tile(id:83, color: .Orange, value:8)
  ]
  
  let ninesGroupOf3 =
  [
    Tile(id:91, color: .Red, value:9),
    Tile(id:92, color: .Blue, value:9),
    Tile(id:93, color: .Orange, value:9)
  ]
  
  let tensGroupOf3 =
  [
    Tile(id:101, color: .Red, value:10),
    Tile(id:102, color: .Blue, value:10),
    Tile(id:103, color: .Orange, value:10)
  ]
  
  let elevensGroupOf3 =
  [
    Tile(id:111, color: .Red, value:11),
    Tile(id:112, color: .Blue, value:11),
    Tile(id:113, color: .Orange, value:11)
  ]
  
  let twelvesGroupOf3 =
  [
    Tile(id:121, color: .Red, value:12),
    Tile(id:122, color: .Blue, value:12),
    Tile(id:123, color: .Orange, value:12)
  ]
  
}