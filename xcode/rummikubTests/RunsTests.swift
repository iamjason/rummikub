////
////  RunsTests.swift
////  rummikub
////
////  Created by Jason Garrett on 1/4/16.
////  Copyright © 2016 Jason Garrett. All rights reserved.
////
//
//import XCTest
//
//class RunsTests: XCTestCase {
//  
//  
//  let t = TestTiles()
//  
//  func testIntergersBasicCase() {
//    
//    struct TestInt : RunValue {
//      var value:Int
//    }
//    
//    let results = runs( [1,2,3,4] )
//    
//    
//    print(results)
//    
//    XCTAssertEqual(results, true, "thre should be three results")
//    
//  }
//  
//  func testTiles() {
//    
//    
//    let results = runs( t.redRunOf4 )
//    
//    print(results)
//    
//    XCTAssertEqual(results.count, 3, "thre should be three results")
//    
//    
//  }
//  
//  
//  func testIntegerAllRunCombinations() {
//    
//    let results = combinations([1,1,2,3,3])
//      .filter { (tiles) in
//        tiles.count >= 3
//      }
//      .filter { (tiles) in
//        
//        var tmp = Set<Int>()
//        for tile in tiles {
//          if !tmp.contains(tile) {
//            tmp.insert(tile)
//          } else {
//            return false
//          }
//        }
//        return true
//    }
//    
//    print(results)
//    
//    XCTAssertEqual(results, [[1, 2, 3], [1, 2, 3], [1, 2, 3], [1, 2, 3]], "didn't find all combos")
//    
//  }
//  
//
//  
//  
//  
//  
//  
//  
//  
//}
