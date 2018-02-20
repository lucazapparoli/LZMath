//
//  Complex.swift
//  LZComplex
//
//  Created by Luca Zapparoli on 17/02/2018.
//  Copyright © 2018 Luca Zapparoli. All rights reserved.
//

import Foundation


public struct LZComplex: CustomStringConvertible, Equatable {
   
    
    public var r: Double
    public var i: Double
    
    
    //MARK:- INITIALIZERS
    public var ρ: Double {
        get {
            return Foundation.sqrt(Foundation.pow(r,2)+Foundation.pow(i,2))
        }
        set {
            r = newValue * cos(φ)
            i = newValue * sin(φ)
        }
    }
    public var φ: Double {
        get {
            return atan2(i,r)
        }
        set {
            r = ρ * cos(newValue)
            i = ρ * sin(newValue)
        }
    }
    
    public init(ρ:Double, φ:Double) {
        r = ρ * cos(φ)
        i = ρ * sin(φ)
    }
    
    
    public init(_ r:Double, _ i:Double) {
        self.r = r
        self.i = i
    }
    
    public init(_ real:Double) {
        self.init(real, 0)
    }
    
    public init () {
        self.init(0,0)
    }
   
    //MARK:- PRINTABLE PROTOCOL
    public var description: String {
        var sign = "+"
        var i = self.i
        if self.i < 0.0 {
            sign = "-"
            i = -self.i
        }
        
        if i != 0 {
        return "\(r) \(sign) i \(i)"
        } else {
            return "\(r)"
        }
    }
    
    //MARK: - MAIN METHODS
    
    public static func log(_ c:LZComplex) -> LZComplex {
        let rho = Darwin.log(c.ρ)
        return LZComplex(ρ: rho, φ: c.φ)
    }
    
    public static func log10(_ c:LZComplex) -> LZComplex {
        let rho = Darwin.log10(c.ρ)
        return LZComplex(ρ: rho, φ: c.φ)
    }
    
    public static func log(base:Double, of c:LZComplex) -> LZComplex {
        return LZComplex.log(c)/LZComplex.log(LZComplex(base))
    }
    
    public static func log(base:LZComplex, of c:LZComplex) -> LZComplex {
        return LZComplex.log(c)/LZComplex.log(base)
    }
    
    public static func pow(_ c:LZComplex,exponent:Double) -> LZComplex {
        return LZComplex(ρ: Foundation.pow(c.ρ,exponent), φ: c.φ * exponent)
    }
    
    public static func pow(_ c:LZComplex,exponent:LZComplex) -> LZComplex {
        let modulo = Foundation.pow(c.ρ, exponent.ρ * cos(exponent.φ))/Foundation.pow(M_E, c.φ * exponent.ρ * sin(exponent.φ))
        let phase = c.φ * exponent.ρ * cos(exponent.φ)
        return LZComplex(ρ: modulo, φ: phase)
    }
    
    public static func sqrt(_ c:LZComplex) -> LZComplex {
        return LZComplex.pow(c, exponent: 0.5)
    }
    
    
    // MARK: - OPERATORS OVERLOADING
    
    public static func == (left: LZComplex, right: LZComplex) -> Bool {
        return (left.r == right.r) && (left.i == right.i)
    }
    
    public static func + (left: LZComplex, right: LZComplex) -> LZComplex {
        return LZComplex(left.r + right.r, left.i + right.i)
    }
    
    public static func - (left: LZComplex, right: LZComplex) -> LZComplex {
        return LZComplex(left.r - right.r, left.i - right.i)
    }
    
    public static func * (left: LZComplex, right: LZComplex) -> LZComplex {
        return LZComplex(left.r * right.r - left.i * right.i, left.r * right.i + left.i * right.r)
    }
    
    public static func / (left: LZComplex, right: LZComplex) -> LZComplex {
        return LZComplex((left.r * right.r + left.i * right.i)/(Foundation.pow(right.r, 2)+Foundation.pow(right.i, 2)), (left.i * right.r - left.r * right.i)/(Foundation.pow(right.r, 2)+Foundation.pow(right.i, 2)))
    }
    
}
