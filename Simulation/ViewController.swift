//
//  ViewController.swift
//  Simulation
//
//  Created by Luca Zapparoli on 20/02/2018.
//  Copyright © 2018 Luca Zapparoli. All rights reserved.
//

import UIKit
import LZMath

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let f1 = LZFraction(num: 2, den: 0)
        let f2 = LZFraction(num: 4, den: 5)
        let f3 = LZFraction(num: 9, den: 2)
        
        
        if f1 > f2 {
            print ("true")
        } else {
            print ("false")
        }
    
        
        let array = [f1,f2,f3]
        
        let new = array.map { (f) -> LZFraction in
            return (f * f)
        }
        
        print(0.factorial())
        print(1.factorial())
        print(2.factorial())
        print(3.factorial())
        
     
       
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

