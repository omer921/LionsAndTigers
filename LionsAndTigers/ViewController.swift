//
//  ViewController.swift
//  LionsAndTigers
//
//  Created by Omer Winrauke on 6/30/15.
//  Copyright (c) 2015 Omer Winrauke. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var breedLabel: UILabel!
    @IBOutlet weak var randomFactLabel: UILabel!
    
    var currentIndex = 0;
    
    var myTigers:[Tiger] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var myTiger = Tiger();
        myTiger.name = "Tigger";
        myTiger.breed = "Bengal";
        myTiger.age = 3;
        myTiger.image = UIImage(named: "BengalTiger.jpg");
        myTiger.chuff();
        myTiger.chuffANumberOfTimes(5, isLoud: false);
        myTiger.age = myTiger.ageInTigerYearsFromAge(myTiger.age);
        
        myTigers.append(myTiger);
        
        myImageView.image = myTiger.image;
        nameLabel.text = myTiger.name;
        ageLabel.text = "\(myTiger.age)";
        breedLabel.text = myTiger.breed;
        randomFactLabel.text = myTiger.randomFact();
        
        
        var secondTiger = Tiger();
        secondTiger.name = "Tigress";
        secondTiger.breed = "Indochinese Tiger";
        secondTiger.age = 2;
        secondTiger.image = UIImage(named: "IndochineseTiger.jpg");
        
        
        
        var thirdTiger = Tiger();
        thirdTiger.name = "Jacob";
        thirdTiger.breed = "Malayin Tiger";
        thirdTiger.age = 4;
        thirdTiger.image = UIImage(named: "MalayanTiger.jpg");
        
        var fourthTiger = Tiger();
        fourthTiger.name = "Spar";
        fourthTiger.breed = "Siberian Tiger";
        fourthTiger.age = 5;
        fourthTiger.image = UIImage(named: "SiberianTiger.jpg");
        
        myTigers += [secondTiger, thirdTiger, fourthTiger];
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextBarButtonItemPressed(sender: UIBarButtonItem) {
        
        var randomIndex:Int;
        do {
            randomIndex = Int(arc4random_uniform(UInt32(myTigers.count)));
        } while (randomIndex == currentIndex);
        let tiger = myTigers[randomIndex];
        
        currentIndex = randomIndex;
        
        
//        myImageView.image = tiger.image;
//        nameLabel.text = tiger.name;
//        ageLabel.text = "\(tiger.age)";
//        breedLabel.text = tiger.breed;
        
        UIView.transitionWithView(self.view, duration: 2, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
            self.myImageView.image = tiger.image;
            self.nameLabel.text = tiger.name;
            self.ageLabel.text = "\(tiger.age)";
            self.breedLabel.text = tiger.breed;
            self.randomFactLabel.text = tiger.randomFact();
            }, completion: { (finished: Bool) -> () in});
        
        
    }


}

