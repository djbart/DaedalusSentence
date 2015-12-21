//
//  GameTimer.swift
//  DaedalusSentence
//
//  Created by Bart Waeterschoot on 21/12/15.
//  Copyright © 2015 Cripplefish Games. All rights reserved.
//

import Foundation
import UIKit

class GameTimer: NSObject {
    let app = UIApplication.sharedApplication().delegate as! AppDelegate
    
    var gameTimerStart = NSTimeInterval()
    var gameTimer = NSTimer()
    var gameTimerLabel = UILabel()
    
    init(label: UILabel) {
        self.gameTimerLabel = label
    }
    
    func initializeGameTimer() {
        gameTimerStart = NSDate.timeIntervalSinceReferenceDate()
        updateGameTime()
        
        let aSelector : Selector = "updateGameTime"
        gameTimer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: aSelector, userInfo: nil, repeats: true)
    }
    
    func updateGameTime() {
        let currentTime = NSDate.timeIntervalSinceReferenceDate()
        
        let elapsedTime: NSTimeInterval = currentTime - gameTimerStart
        let gameTimerInSecondsRemaining = app.gameTimerInSeconds - Int(round(elapsedTime))
        
        let hours = UInt8(gameTimerInSecondsRemaining / 3600)
        let minutes = UInt8(gameTimerInSecondsRemaining % 3600 / 60)
        let seconds = UInt8(gameTimerInSecondsRemaining % 3600 % 60)
        
        let strHours = String(format: "%02d", hours)
        let strMinutes = String(format: "%02d", minutes)
        let strSeconds = String(format: "%02d", seconds)
        
        gameTimerLabel.text = "\(strHours):\(strMinutes):\(strSeconds)"
    }
}