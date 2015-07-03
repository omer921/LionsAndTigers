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
    
    var lions:[Lion] = [];
    
    var lionCubs:[LionCub] = [];
    
    var currentAnimal = (species: "Tiger", index: 0);
    
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
        
        
        var lion = Lion();
        lion.age = 4;
        lion.isAlphaMale = false;
        lion.image = UIImage(named: "Lion.jpg");
        lion.name = "Mufasa";
        lion.supSpecies = "West African";
        
        var lioness = Lion();
        lioness.age = 3;
        lioness.isAlphaMale = false;
        lioness.image = UIImage(named: "Lioness.jpeg");
        lioness.name = "Serabi";
        lioness.supSpecies = "Barbary";
        
        lion.changeToAlphaMale();
        
        var lionCub = LionCub();
        lionCub.age = 1;
        lionCub.name = "Simba";
        lionCub.image = UIImage(named: "LionCub1.jpg");
        lionCub.supSpecies = "Masai";
        lionCub.isAlphaMale = true;
        lionCub.roar();
        
        var femaleLionCub = LionCub();
        femaleLionCub.age = 1;
        femaleLionCub.name = "Nala";
        femaleLionCub.image = UIImage(named: "LionCub2.jpeg");
        femaleLionCub.supSpecies = "Transvaal";
        femaleLionCub.isAlphaMale = false;
        
        lionCubs += [lionCub, femaleLionCub];
        
        lions += [lion, lioness];
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextBarButtonItemPressed(sender: UIBarButtonItem) {
        updateAnimal();
        updateView();
    }
    
    func updateAnimal() {
        switch currentAnimal {
        case ("Tiger", _):
            let randomIndex = Int(arc4random_uniform(UInt32(lions.count)));
            currentAnimal = ("Lion", randomIndex);
        case ("Lion", _):
            let randomIndex = Int(arc4random_uniform(UInt32(lionCubs.count)));
            currentAnimal = ("LionCub", randomIndex);
        default:
            let randomIndex = Int(arc4random_uniform(UInt32(myTigers.count)));
            currentAnimal = ("Tiger", randomIndex);
        }
    }
    
    func updateView() {
        
        UIView.transitionWithView(self.view, duration: 2, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
            
            if (self.currentAnimal.species == "Tiger") {
                let tiger = self.myTigers[self.currentAnimal.index];
                self.myImageView.image = tiger.image;
                self.breedLabel.text = tiger.breed;
                self.ageLabel.text = "\(tiger.age)";
                self.nameLabel.text = tiger.name;
                self.randomFactLabel.text = tiger.randomFact();
            }
            else if (self.currentAnimal.species == "Lion") {
                let lion = self.lions[self.currentAnimal.index];
                self.myImageView.image = lion.image;
                self.breedLabel.text = lion.supSpecies;
                self.ageLabel.text = "\(lion.age)";
                self.nameLabel.text = lion.name;
                self.randomFactLabel.text = lion.randomFact();
            }
            else {
                let lionCub = self.lions[self.currentAnimal.index];
                self.myImageView.image = lionCub.image;
                self.breedLabel.text = lionCub.supSpecies;
                self.ageLabel.text = "\(lionCub.age)";
                self.nameLabel.text = lionCub.name;
                self.randomFactLabel.text = lionCub.randomFact();
            }
            
            self.randomFactLabel.hidden = false;
            
            }, completion: { (finished: Bool) -> () in});
        
        
    }


}

