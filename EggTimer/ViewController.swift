//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let eggTimes : [String:Int] = ["Soft": 5, "Medium": 7, "Hard": 12]
    var timer = Timer()
    var player: AVAudioPlayer!
    
    @IBOutlet weak var eggsLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle!
    
        timer.invalidate()
        progressBar.progress = 1.0
//        print(eggTimes[hardness]!)
        
        var seconds = eggTimes[hardness]!
        let totalTime = eggTimes[hardness]!
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
//            print("Timer fired!")
            
            if seconds > 0 {
                print(seconds)
                seconds-=1
                print(Float(seconds / self.eggTimes[hardness]!))
                print(seconds)
                print(self.eggTimes[hardness]!)
                let percentageProgress = Float(seconds) /
                Float(totalTime )
                self.progressBar.progress = percentageProgress
                print(percentageProgress)
            } else {
                timer.invalidate()
                self.eggsLabel.text = "Done"
                self.playSound()
            }
            
        }
        
       
        
    }
    func playSound() {
        
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }

}
