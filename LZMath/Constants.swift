//
//  Constants.swift
//  LZMath
//
//  Created by Luca Zapparoli on 25/02/2018.
//  Copyright © 2018 Luca Zapparoli. All rights reserved.
//

import Foundation


let π = Double.pi
let e = M_E



//MARK:- EXTENSIONS



public extension Int {
    
    public func isEven() -> Bool {
        return self % 2 == 0
    }
    
    public func isPrime() -> Bool {
        let n = Int(sqrt(Double(self)))
        return (1...n).filter({self % $0 == 0}).count < 2
    }
    
    public func allPrimesBefore() -> [Int] {
        var array = [Int]()
        for i in 2..<self {
            if i.isPrime() {
                array.append(i)
            }
        }
        return array
    }
    
    public func factorial() -> Int {
        if(self == 0){
            return 1
        } else {
            return self * (self-1).factorial()
        }
    }
    
  
    
}
