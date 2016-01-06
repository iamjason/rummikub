//
//  CombinationsTests.swift
//  rummikub
//
//  Created by Jason Garrett on 1/3/16.
//  Copyright © 2016 Jason Garrett. All rights reserved.
//

import XCTest

class CombinationsTests: XCTestCase {
  
  func _testCombinationsWithSizeSimpleIntegerCase() {
    
    let array = [1,2,3]
    let result = combinationsOfSize(array, k: 2)
    
    let expectedResult = [[1,2], [1,3], [2,3]]
    XCTAssertEqual(result, expectedResult, "These should match :)")
    
  }
  
  
  func _testAllCombinationsSimpleIntegerCase() {
    
    let array = [1,2,3]
    let result = combinations(array)
    
    let expectedResult = [[1], [2], [3], [1,2], [1,3], [2,3], [1,2,3]]
    XCTAssertEqual(result, expectedResult, "These should match :)")
    
  }
  
}
