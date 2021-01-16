//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var btnSoft: UIButton!
    @IBOutlet weak var btnMed: UIButton!
    @IBOutlet weak var btnHard: UIButton!
    
    @IBOutlet weak var pvTimer: UIProgressView!
    @IBOutlet weak var lblTitle: UILabel!
    
    //    let softTime = 5, medTime = 7, hardTime = 12
    let eggTimes = ["Soft": 5, "Medium": 7, "Hard": 12]
    var timer = Timer()
    var current = 10
    var total = 10
    
    @IBAction func selectH(_ sender: UIButton) {
        pvTimer.progress = 0.0
        
        debugPrint(sender.currentTitle ?? "Not good..")
        let hardness = sender.currentTitle
        guard let time = eggTimes[hardness!] else {return}
        print(time)
        
        current = time
        total = time
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(update), userInfo: nil, repeats: true)
    }
    @objc func update() {
        pvTimer.progress = 1.0 - (Float(current) / Float(total))
        if(current > 0) {
            print("\(current) remaining..")
            current -= 1
        }
        else {
            print("Done")
            lblTitle.text = "DONE!"
            timer.invalidate()
        }
    }
}

