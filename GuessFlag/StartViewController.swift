//
//  StartViewController.swift
//  GuessFlag
//
//  Created by Dawid on 20/03/2018.
//  Copyright © 2018 BZN8. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
    @IBOutlet weak var startBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        startBtn.layer.cornerRadius = 50
        startBtn.layer.borderWidth = 1
        self.navigationController?.isNavigationBarHidden = true
    }


}
