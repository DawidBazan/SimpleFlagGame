//
//  ViewController.swift
//  GuessFlag
//
//  Created by Dawid on 20/03/2018.
//  Copyright © 2018 BZN8. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UIViewController {
    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = false
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "netherlands", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        btn1.btnBorder()
        btn2.btnBorder()
        btn3.btnBorder()
        
        question()
    }
    
    func question(action: UIAlertAction! = nil){
        countries = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: countries) as! [String]
        
        btn1.setImage(UIImage(named: countries[0]), for: .normal)
        btn2.setImage(UIImage(named: countries[1]), for: .normal)
        btn3.setImage(UIImage(named: countries[2]), for: .normal)
        
        correctAnswer = GKRandomSource.sharedRandom().nextInt(upperBound: 3)
        title = countries[correctAnswer].uppercased()
    }
    
    @IBAction func btnPressed(_ sender: UIButton) {
        var title: String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else{
            title = "Incorrect"
            score -= 1
        }
        
        let message = "Your score is \(score)"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: question))
        present(alert, animated: true)
        
    }
    
}

extension UIButton {
    func btnBorder(){
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.gray.cgColor
        
    }
    
}
