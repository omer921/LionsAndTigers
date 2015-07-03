//
//  LionCub.swift
//  LionsAndTigers
//
//  Created by Omer Winrauke on 7/3/15.
//  Copyright (c) 2015 Omer Winrauke. All rights reserved.
//

import Foundation

class LionCub:Lion {
    func rubLionCubBelly() {
        println("Lion Cub: Snuggle and be happy");
    }
    
    override func roar() {
        super.roar();
        println("Lion Cub: Growl Growl");
    }
    
    override func randomFact() -> String {
        var randomFact:String;
        if isAlphaMale {
            randomFact = "Cubs hide for six weeks";
        }
        else {
            randomFact = "Cubs begin eating meat at 6 weeks";
        }
        return randomFact;
    }
    
}