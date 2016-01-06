//
//  Combinations.swift
//  rummikub
//
//  Created by Jason Garrett on 1/3/16.
//  Copyright © 2016 Jason Garrett. All rights reserved.
//

import Foundation

/** TODO: cite source of this... I think rosetta code?
 
 Find combinations of an array of type 'T' and size 'k'
 e.g. combinations([1,2,3]) -> [[1, 2], [1, 3], [2, 3]]
 
 */
func combinationsOfSize<T>(var arr: [T], k: Int) -> [[T]] {
  
  func sliceArray<T>(var arr: [T], x1: Int, x2: Int) ->[T] {
    var tt: [T] = []
    for var ii = x1; ii <= x2; ++ii {
      tt.append(arr[ii])
    }
    return tt
  }
  
  var ret = [[T]]()
  var sub = [[T]]()
  var next = [T]()
  
  for var i = 0; i < arr.count; ++i {
    if(k == 1){
      ret.append([arr[i]])
    } else {
      sub = combinationsOfSize(sliceArray(arr, x1: i + 1, x2: arr.count - 1), k: k - 1)
      for var subI = 0; subI < sub.count; ++subI {
        next = sub[subI]
        next.insert(arr[i], atIndex: 0)
        ret.append(next)
      }
    }
  }
  
  return ret
  
}

/**
 
 Find all combinations of an array of type 'T'
 e.g. combinations([1,2,3]) -> [[1], [2], [3], [1, 2], [1, 3], [2, 3], [1, 2, 3]]
 
 */
func combinations<T>(objects:[T]) -> [[T]] {
  var ret = [[T]]()
  for var i = 1; i <= objects.count; i++ {
    let combos = combinationsOfSize(objects, k: i)
    ret = ret + combos
  }
  return ret
}

