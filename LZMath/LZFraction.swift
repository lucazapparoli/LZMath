//
//  LZFraction.swift
//  LZMath
//
//  Created by Luca Zapparoli on 20/02/2018.
//  Copyright © 2018 Luca Zapparoli. All rights reserved.
//

import Foundation


public struct LZFraction: CustomStringConvertible, Equatable {
    
    
    public var num: Int
    public var den: Int

    public init(num:Int, den:Int) {
        self.num = num
        self.den = den
    }
    


    //MARK:- PRINTABLE PROTOCOL
    public var description: String {
        let sign = num>0 && den>0 || num<0 && den<0 ? "" : "-"
        return ("\(sign) \(abs(num))/\(abs(den))")
    }
    
    public static func == (left: LZFraction, right: LZFraction) -> Bool {
        return (left.num * right.den == left.den * right.num)
    }
}
