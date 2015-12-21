//
//  Play.swift
//  DaedalusSentence
//
//  Created by Bart Waeterschoot on 21/12/15.
//  Copyright © 2015 Cripplefish Games. All rights reserved.
//

import UIKit

class Play: UIViewController {

    @IBOutlet weak var gameTimerLabel: UILabel!
    var startTime = NSTimeInterval()
    let gameTimerInSeconds = 3600;
    var timer = NSTimer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        startTime = NSDate.timeIntervalSinceReferenceDate()
        updateTime()
        
        let aSelector : Selector = "updateTime"
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: aSelector, userInfo: nil, repeats: true)
    }
    
    func updateTime() {
        let currentTime = NSDate.timeIntervalSinceReferenceDate()
        
        let elapsedTime: NSTimeInterval = currentTime - startTime
        let gameTimerInSecondsRemaining = gameTimerInSeconds - Int(round(elapsedTime))
        
        let hours = UInt8(gameTimerInSecondsRemaining / 3600)
        let minutes = UInt8(gameTimerInSecondsRemaining % 3600 / 60)
        let seconds = UInt8(gameTimerInSecondsRemaining % 3600 % 60)

        let strHours = String(format: "%02d", hours)
        let strMinutes = String(format: "%02d", minutes)
        let strSeconds = String(format: "%02d", seconds)
        
        gameTimerLabel.text = "\(strHours):\(strMinutes):\(strSeconds)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
}
