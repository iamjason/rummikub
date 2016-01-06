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

func runs<T:RunValue>( array:[T] ) -> [[T]] {
  
  var result = [[T]]()

  for var i = 0; i < array.count; i++ {
    
    var ii = i + 1
    while ii < array.count {

      
      let v1 = array[ii - 1].value
      let v2 = array[ii].value - 1
      //print("\(i)--- \(v1) - \(v2)")
      // because the generic type conforms to our 
      if v1 == v2 {
        
        // runs of three or greater are accepted
        if ii - i + 1 >= 3 {
          result.append(Array(array[i...ii]))
        }
        
        ii = ii + 1
        
      } else {
        break;
      }

      
    
      
      
    }
    
  }
  
  return result
  
}

