//
//  Runs.swift
//  rummikub
//
//  Created by Jason Garrett on 1/4/16.
//  Copyright © 2016 Jason Garrett. All rights reserved.
//

import Foundation

protocol RunValue {
  var value:Int { get }
}

func min<T:RunValue>(array:[T]) -> Int {
  return array.reduce(Int.max) { (result, value) -> Int in
    if value.value < result {
      return value.value
    }
    return result
  }
}

func max<T:RunValue>(array:[T]) -> Int {
  return  array.reduce(0) { (result, value) -> Int in
    if value.value > result {
      return value.value
    }
    return result
  }
}

func isValidRun<T:RunValue>( array:[T] ) -> Bool {
  
  let minValue = min(array)
  let maxValue = max(array)
  
  if maxValue - minValue + 1 == array.count {
    
    var visited = Set<Int>()
    for var i = 0; i < array.count; i++ {
      
      if visited.contains(array[i].value) == true {
        return false
      }
      
      visited.insert(array[i].value)
    }
    
    return true
    
  }
  
  return false
  
}