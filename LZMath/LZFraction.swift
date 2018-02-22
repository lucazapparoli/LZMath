//
//  LZFraction.swift
//  LZMath
//
//  Created by Luca Zapparoli on 20/02/2018.
//  Copyright © 2018 Luca Zapparoli. All rights reserved.
//

import Foundation


public struct LZFraction: CustomStringConvertible, Comparable {
    
    private var num: Int
    private var den: Int
    
    public var numerator:Int {return num}
    public var denominator:Int {return den}

    public init(num:Int, den:Int) {
        let gcd = LZFraction.gcd(a: num, b: den)
        self.num = num / gcd
        self.den = den / gcd
    }
    
    public init(int:Int) {
        self.init(num: int, den: 1)
    }
    
    //MARK:- HELP FUNCTIONS
    private static func gcd(a: Int, b: Int) -> Int {
        if b == 0 { return a }
        return gcd(a: b, b: a % b)
    }
    
    private func isNegative() -> Bool {
        if (self.num >= 0 && self.den >= 0 || self.num <= 0 && self.den <= 0) {
            return false
        } else {
            return true
        }
    }
    
    
    //MARK:- CUSTOM STRING CONVERTIBLE PROTOCOL
    public var description: String {
        if num == 0 { return "0" }
        if den == 0 { return "infinite"}
        if abs(den) == 1 { return "\(num * den)" }
       // if abs(den) == 0 { return "\(num / den)"}
        let sign = self.isNegative() ? "-" : ""
        return ("\(sign) \(abs(num))/\(abs(den))")
    }
    
    //MARK: OPERATORS OVERLOADING
    public static func + (left: LZFraction, right: LZFraction) -> LZFraction {
        return LZFraction(num:left.num * right.den + left.den * right.num, den:left.den * right.den)
    }
    
    public static func - (left: LZFraction, right: LZFraction) -> LZFraction {
        return LZFraction(num:left.num * right.den - left.den * right.num, den:left.den * right.den)
    }
    
    public static func * (left: LZFraction, right: LZFraction) -> LZFraction {
        return LZFraction(num:left.num * right.num, den: left.den * right.den)
    }
    
    public static func / (left: LZFraction, right: LZFraction) -> LZFraction {
        return LZFraction(num:left.num * right.den, den: left.den * right.num)
    }
    
    //MARK: OTHER MATH METHODS FOR FRACTIONS
    

    
    //TODO: develop other math operations for fractions
    
    
    //MARK:- COMPARABLE PROTOCOL
   
    public static func == (left: LZFraction, right: LZFraction) -> Bool {
        return (left.num * right.den == left.den * right.num)
    }
 
    public static func < (left: LZFraction, right: LZFraction) -> Bool {
        return (left.num * right.den < left.den * right.num)
    }
}
