//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var eggLabel: UILabel!
    @IBOutlet weak var eggBoilProgressBar: UIProgressView!
    
    let boilTime = ["Soft" : 7, "Medium" : 10, "Hard" : 12]
    
    var timeRemaining: Int?
    var totalTime: Int?
    var timer = Timer()
    
    @IBAction func eggBoilPressed(_ sender: UIButton) {
        
        timer.invalidate()
        
        timeRemaining = boilTime[sender.currentTitle!]!
        totalTime = boilTime[sender.currentTitle!]!
        
        eggLabel.text = "Boiling Egg, wait " +  String(timeRemaining!) + " seconds"
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timeFired), userInfo: nil, repeats: true)
    }
    
    @objc func timeFired() {
        timeRemaining! -= 1
        
        let progress = Float(totalTime! - timeRemaining!) / Float(totalTime!)
        eggBoilProgressBar.progress = progress
        
        if timeRemaining == 0 {
            eggLabel.text = "DONE !!!"
            timer.invalidate()
        } else {
            eggLabel.text = "Boiling Egg, wait " +  String(timeRemaining!) + " seconds"
        }
    }
}
