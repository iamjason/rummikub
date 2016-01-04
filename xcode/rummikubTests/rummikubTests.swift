//
//  rummikubTests.swift
//  rummikubTests
//
//  Created by Jason Garrett on 1/2/16.
//  Copyright © 2016 Jason Garrett. All rights reserved.
//

import XCTest
@testable import rummikub

class rummikubTests: XCTestCase {
  
  let t = TestTiles()
  
  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  func testCreatePile() {
    
    var rack = Rack(tiles:[])
    var pile = Pile.createPile()

    XCTAssertEqual(rack.tiles.count, 0, "A new rack should have an empty tile count")
    XCTAssertEqual(pile.tiles.count, 48, "A new pile should have 48 tiles")
    
    for _ in 1...12 {
      let tile = pile.drawTile()
      rack.addTile(tile)
    }
    
    XCTAssertEqual(rack.tiles.count, 12, "After drawing rack should have 12 tiles.")
    XCTAssertEqual(pile.tiles.count, 36, "A new pile should have 48 tiles")
    
    let tileToRemove = rack.tiles[0]
    rack.removeTile(tileToRemove)
    XCTAssertEqual(rack.tiles.count, 11, "After playing a tile rack should have 11 tiles.")
    
  }
  
  func testTileGroupRunScore(){
    
    let group = TileGroup(tiles:t.redRunOf4)
    
    XCTAssertEqual(group.score, 10, "groups score is 6")
    
  }
  
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

  func testTileStrategyFilterInvalidGroups(){
    
    let strategy = BasicStrategy()
    
    let tiles = t.onesGroupOf4_invalid_two_red_tiles
    let play = TileGroupPlay(groups:strategy.findGroups(tiles))
    XCTAssertEqual(play.score, 3, "play is worth 3 points")
    XCTAssertEqual(play.totalTiles, 3, "play shoul have 3 tiles")
  
  }
  
}
