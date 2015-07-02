//
//  Lion.swift
//  LionsAndTigers
//
//  Created by Omer Winrauke on 7/2/15.
//  Copyright (c) 2015 Omer Winrauke. All rights reserved.
//

import Foundation
import UIKit

class Lion {
    var age = 0;
    var isAlphaMale = false;
    var image = UIImage(named: "");
    var name = "";
    var supSpecies = "";
    
    func roar() {
        println("Lion: Roar Roar");
    }
    
    func changeToAlphaMale() {
        isAlphaMale = true;
    }
    
    func randomFact() -> String {
        var randomFact:String;
        
        if isAlphaMale {
            randomFact = "Male lions have big manes.";
        }
        else {
            randomFact = "Femal lions are called lioness";
        }
        return randomFact;
    }
}