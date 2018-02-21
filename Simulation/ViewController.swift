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
        
        let f1 = LZFraction(num: -2, den: 3)
        let f2 = LZFraction(num: 34, den: 78)
        
        let f3 = f1 + f2
        
        if f1 == f2 {
            print ("true")
        } else {
            print ("false")
        }
    
       
        
        print (f2)
        
      
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

