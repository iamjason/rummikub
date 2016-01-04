//
//  RunsTests.swift
//  rummikub
//
//  Created by Jason Garrett on 1/4/16.
//  Copyright © 2016 Jason Garrett. All rights reserved.
//

import XCTest

class RunsTests: XCTestCase {


  func testIntergersBasicCase() {

    let results = runs([1,2,3,4])

    print(results)
    
    XCTAssertEqual(results, [[1,2,3],[1,2,3,4],[2,3,4]], "arrays should match")
    
  }

}
