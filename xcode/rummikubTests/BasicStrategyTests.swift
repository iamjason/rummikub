//
//  BasicStrategyTests.swift
//  rummikub
//
//  Created by Jason Garrett on 1/3/16.
//  Copyright © 2016 Jason Garrett. All rights reserved.
//

import XCTest

class BasicStrategyTests: XCTestCase {

  let t = TestTiles()
  
  func testTileStrategyFindGroups(){
    
    let strategy = BasicStrategy()
    let tile = [Tile(id: 1000, color: .Red, value: 10)]
    let play1 = TileGroupPlay(groups:strategy.findGroups(t.threesGroupOf4 + tile))
    
    XCTAssertEqual(play1.score, 12, "play is worth 12 points")
    XCTAssertEqual(play1.totalTiles, 4, "play shoul have 4 tiles")
    
    let tiles2 = t.threesGroupOf4 + t.foursGroupOf3
    let play2 = TileGroupPlay(groups:strategy.findGroups(tiles2 + tile))
    
    XCTAssertEqual(play2.score, 24, "play is worth 24 points")
    XCTAssertEqual(play2.totalTiles, 7, "play shoul have 8 tiles")
    
  }

  func testTileStrategyFindGroupsAdvanced(){
    
    let strategy = BasicStrategy()
    let tiles = t.threesGroupOf4 + t.foursGroupOf3 + [Tile(id: 1000, color: .Red, value: 10)]
    let play = TileGroupPlay(groups:strategy.findGroups(tiles))
    
    XCTAssertEqual(play.score, 24, "play is worth 24 points")
    XCTAssertEqual(play.totalTiles, 7, "play shoul have 8 tiles")
    
  }
  
  // one color has a duplicate
  func testFindGroupsMultipleColorsInSetBasic(){
    
    let strategy = BasicStrategy()
    let tiles = t.onesGroupOf4_invalid_two_red_tiles
    let play = TileGroupPlay(groups:strategy.findGroups(tiles))
    XCTAssertEqual(play.score, 3, "play is worth 3 points")
    XCTAssertEqual(play.totalTiles, 3, "play shoul have 3 tiles")
    
  }
  
  // multiple colors have duplicates
  func testFindGroupsMultipleColorsInSetAdvanced(){
    
    let strategy = BasicStrategy()

    // in two reds are unplayable here
    let tiles = t.onesGroupOf4_invalid_two_red_tiles + t.twosGroupOf4_invalid_two_red_tiles
    let play = TileGroupPlay(groups:strategy.findGroups(tiles))
    XCTAssertEqual(play.score, 9, "duplicate wasn't removed properly")
    XCTAssertEqual(play.totalTiles, 6, "duplicate wasn't removed properly")
    
  }
  

}
