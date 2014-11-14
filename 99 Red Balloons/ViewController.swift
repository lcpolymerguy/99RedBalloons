//
//  ViewController.swift
//  99 Red Balloons
//
//  Created by Morgan Hart on 11/13/14.
//  Copyright (c) 2014 Morgan Hart. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var balloonsImage: UIImageView!
    @IBOutlet weak var balloonsLabel: UILabel!

    var balloonsArray:[Balloon] = []
    
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        createBalloons()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func balloonsButton(sender: UIBarButtonItem) {
        
        balloonsLabel.text = "\(balloonsArray[index].number) balloons"
        balloonsImage.image = balloonsArray[index].image
        if index<=99 {
            index++
        }
        else {
            index = 0
        }
    }

    func createBalloons() {
        
        var lastRandomValue = 0
        
        var randomNumber: Int
        
        for var balloonCount = 0; balloonCount<=99; balloonCount++ {
            
            var balloon = Balloon()
            
            balloon.number = balloonCount
            
            do {
            
            randomNumber = Int(arc4random_uniform(UInt32(4)))
            
            } while randomNumber == lastRandomValue
            
            lastRandomValue = randomNumber
            
            switch randomNumber {
            
            case 1:
                balloon.image = UIImage(named:"RedBalloon1.jpg")
                
            case 2:
                balloon.image = UIImage(named:"RedBalloon2.jpg")
            
            case 3:
                balloon.image = UIImage(named:"RedBalloon3.jpg")
                
            default:
                balloon.image = UIImage(named:"RedBalloon4.jpg")
            }
            
         self.balloonsArray.append(balloon)
        }
    }
}

