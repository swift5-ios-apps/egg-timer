//
//  ViewController.swift
//  Egg Timer
//
//  Created by chirag on 2/24/20.
//  Copyright © 2020 chirag. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var timerClock = Timer()
    var timeLeft:Int = 210
    
    @objc func decreseTimer () {
        if timeLeft > 0 {
            timeLeft -= 1
            timer.text = String(timeLeft)
        } else {
            timerClock.invalidate()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var timer: UILabel!
    
    @IBAction func play(_ sender: Any) {
        timerClock = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.decreseTimer), userInfo: nil, repeats: true)
    }
    
    @IBAction func addTen(_ sender: Any) {
        timeLeft += 10
        timer.text = String(timeLeft)
    }
    
    @IBAction func removeTen(_ sender: Any) {
        if timeLeft > 10 {
            timeLeft -= 10
        }
        timer.text = String(timeLeft)
    }
    
    @IBAction func pause(_ sender: Any) {
        timerClock.invalidate()
    }
    
    @IBAction func reset(_ sender: Any) {
        timeLeft = 210
        timer.text = String(timeLeft)
    }
}

