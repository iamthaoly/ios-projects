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
    
//    let softTime = 5, medTime = 7, hardTime = 12
    let eggTimes = ["Soft": 5, "Medium": 7, "Hard": 12]
    var timer: Timer? = nil
    var total = 10
    
    @IBAction func selectH(_ sender: UIButton) {
        debugPrint(sender.currentTitle ?? "Not good..")
        let hardness = sender.currentTitle
        guard let time = eggTimes[hardness!] else {return}
        print(time)
        
        total = time
        if timer != nil {
            timer!.invalidate()
        }
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(update), userInfo: nil, repeats: true)
    }
    @objc func update() {
        if(total > 0) {
            print("\(total) remaining..")
            total -= 1
        }
    }
}

