//
//  Runs.swift
//  rummikub
//
//  Created by Jason Garrett on 1/4/16.
//  Copyright © 2016 Jason Garrett. All rights reserved.
//

import Foundation


func runs( array:[Int] ) -> [[Int]] {
  
  var result = [[Int]]()
  
  
  for var i = 0; i < array.count; i++ {
    
    var ii = i + 1
    while ii < array.count {
      print("i:\(i):\(array[i]) ii:\(ii):\(array[ii]) ")
      // runs of three or greater are accepted
      if ii - i + 1 >= 3 {
        let t = Array(array[i...ii])
        print("found \(t)")
        result.append(t)
        
      }
      
      if array[ii - 1] == array[ii] - 1 {
        ii = ii + 1
      } else {
        break;
      }
      
      
    }
    
  }
  
  return result
  
}

