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

  
}
