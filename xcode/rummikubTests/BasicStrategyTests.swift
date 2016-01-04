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
  //
  func testTileStrategyFindGroups(){
    
    let strategy = BasicStrategy()
    let tile = [Tile(id: 1000, color: .Red, value: 10)]
    let play1 = strategy.solve(t.threesGroupOf4 + tile)
    
    XCTAssertEqual(play1.score, 12, "play is worth 12 points")
    XCTAssertEqual(play1.totalTiles, 4, "play shoul have 4 tiles")
    
    let tiles2 = t.threesGroupOf4 + t.foursGroupOf3
    let solution2 = strategy.solve(tiles2)
    
    XCTAssertEqual(solution2.score, 24, "play is worth 24 points")
    XCTAssertEqual(solution2.totalTiles, 7, "play shoul have 8 tiles")
    
  }
  
  func testTileStrategyFindGroupsAdvanced(){
    
    let strategy = BasicStrategy()
    let tiles = t.threesGroupOf4 + t.foursGroupOf3 + [Tile(id: 1000, color: .Red, value: 10)]
    let solution = strategy.solve(tiles)
    
    XCTAssertEqual(solution.score, 24, "play is worth 24 points")
    XCTAssertEqual(solution.totalTiles, 7, "play shoul have 8 tiles")
    
  }
  
  // one color has a duplicate
  func testFindGroupsMultipleColorsInSetBasic(){
    
    let strategy = BasicStrategy()
    let tiles = t.onesGroupOf4_invalid_two_red_tiles
    let play = strategy.solve(tiles)
    
    XCTAssertEqual(play.score, 3, "play is worth 3 points")
    XCTAssertEqual(play.totalTiles, 3, "play shoul have 3 tiles")
    
  }
  
  // multiple sets have duplicate colors
  func testFindGroupsMultipleColorsInSetAdvanced(){
    
    let strategy = BasicStrategy()
    
    // in two reds are unplayable here
    let tiles = t.onesGroupOf4_invalid_two_red_tiles + t.twosGroupOf4_invalid_two_red_tiles
    let play = strategy.solve(tiles)
    
    XCTAssertEqual(play.score, 9, "duplicate wasn't removed properly")
    XCTAssertEqual(play.totalTiles, 6, "duplicate wasn't removed properly")
    
  }
  
  // multiple sets of same number
  func testFindMultipleOfSameNumber(){
    
    let strategy = BasicStrategy()
    
    let tiles = t.onesGroupOf4 + t.onesGroupOf4b + t.twosGroupOf4
    let solution = strategy.solve(tiles)
    print("solution: \(solution)")
    
    XCTAssertEqual(solution.score, 16)
    XCTAssertEqual(solution.totalTiles, 12)
    
  }
  
  
}
