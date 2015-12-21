//
//  RoundTimer.swift
//  DaedalusSentence
//
//  Created by Bart Waeterschoot on 21/12/15.
//  Copyright © 2015 Cripplefish Games. All rights reserved.
//

import Foundation
import UIKit

class RoundTimer: NSObject {
    let app = UIApplication.sharedApplication().delegate as! AppDelegate
    
    var roundTimerStart = NSTimeInterval()
    var roundTimer = NSTimer()
    var startRoundText = true
    
    var timerLabel = UILabel()
    var timerButton = UIButton()
    var roundTimeInSeconds: Int!
    
    init(label: UILabel, button: UIButton) {
        self.timerLabel = label
        self.timerButton = button
        
        timerButton.setTitle(String(format: "Start Round %d", app.currentRoundNumber), forState: UIControlState.Normal)
    }
    
    func setRoundTime(timeInSeconds: Int) {
        roundTimeInSeconds = timeInSeconds
        
        let strSeconds = String(format: "%02d", roundTimeInSeconds)
        timerLabel.text = "\(strSeconds)"
    }
    
    func toggleTimer() {
        if (startRoundText == true)
        {
            startRound()
        }
        else
        {
            finishRound()
        }
    }
    
    func startRound(){
        timerButton.setTitle(String(format: "End Round %d", app.currentRoundNumber), forState: UIControlState.Normal)
        
        initializeRoundTimer()
        startRoundText = false
    }
    
    func finishRound() {
        roundTimer.invalidate()
        
        app.currentRoundNumber++
        timerButton.setTitle(String(format: "Start Round %d", app.currentRoundNumber), forState: UIControlState.Normal)
        
        timerLabel.text = String(format: "%02d", roundTimeInSeconds)
        startRoundText = true
    }
    
    func initializeRoundTimer() {
        roundTimerStart = NSDate.timeIntervalSinceReferenceDate()
        updateRoundTime()
        
        let aSelector : Selector = "updateRoundTime"
        roundTimer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: aSelector, userInfo: nil, repeats: true)
    }
    
    func updateRoundTime() {
        let currentTime = NSDate.timeIntervalSinceReferenceDate()
        
        let elapsedTime: NSTimeInterval = currentTime - roundTimerStart
        let roundTimerInSecondsRemaining = roundTimeInSeconds - Int(round(elapsedTime))
        
        let strSeconds = String(format: "%02d", roundTimerInSecondsRemaining)
        timerLabel.text = "\(strSeconds)"
        
        if (roundTimerInSecondsRemaining == 0)
        {
            finishRound()
        }
    }

}