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
        let gcd = LZFraction.gcd(a: num, b: den)
        self.num = num / gcd
        self.den = den / gcd
    }
    
    
    private static func gcd(a: Int, b: Int) -> Int {
        if b == 0 { return a }
        return gcd(a: b, b: a % b)
    }
    
    
    //MARK:- PRINTABLE PROTOCOL
    public var description: String {
        if num == 0 { return "0" }
        if abs(den) == 1 { return "\(num * den)" }
        if abs(den) == 0 { return "result undefined, division by zero: \(num) / \(abs(den))"}
        let sign = num>=0 && den>=0 || num<=0 && den<=0 ? "" : "-"
        return ("\(sign) \(abs(num))/\(abs(den))")
    }
    
    
    public static func + (left: LZFraction, right: LZFraction) -> LZFraction {
        return LZFraction(num:left.num * right.den + left.den * right.num, den:left.den * right.den)
    }
    
    public static func - (left: LZFraction, right: LZFraction) -> LZFraction {
        return LZFraction(num: 1, den: 1)
    }
    
    public static func * (left: LZFraction, right: LZFraction) -> LZFraction {
        return LZFraction(num: 1, den: 1)
    }
    
    public static func / (left: LZFraction, right: LZFraction) -> LZFraction {
        return LZFraction(num: 1, den: 1)
    }
    
    //TODO: develop other math operations for fractions
    
    
    
    
    public static func == (left: LZFraction, right: LZFraction) -> Bool {
        return (left.num * right.den == left.den * right.num)
    }
}
