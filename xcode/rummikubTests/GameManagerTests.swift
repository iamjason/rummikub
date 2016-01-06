//
//  GameManagerTests.swift
//  rummikub
//
//  Created by Jason Garrett on 1/5/16.
//  Copyright © 2016 Jason Garrett. All rights reserved.
//

import XCTest

class GameManagerTests: XCTestCase {

    func testGame() {

  
      let manager = TestGameManager()
      manager.startGame()
      print(manager)
      
    }


}
