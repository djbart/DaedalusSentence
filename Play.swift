//
//  Play.swift
//  DaedalusSentence
//
//  Created by Bart Waeterschoot on 21/12/15.
//  Copyright © 2015 Cripplefish Games. All rights reserved.
//

import UIKit

class Play: UIViewController {
    
    let app = UIApplication.sharedApplication().delegate as! AppDelegate

    @IBOutlet weak var gameTimerLabel: UILabel!
    var gameTimerStart = NSTimeInterval()
    var gameTimer = NSTimer()
    
    
    @IBOutlet weak var roundTimerLabel: UILabel!
    @IBOutlet weak var startRoundButton: UIButton!
    var roundTimerStart = NSTimeInterval()
    var roundTimer = NSTimer()
    var startRoundText = true
    
    @IBOutlet weak var dieSpecialImageView: UIImageView!
    var dieSpecialValue = 1;
    @IBAction func dieSpecialTouch(sender: AnyObject) {
        dieSpecialValue = RollDie()
        let imageName = String(format: "die_special_%d", dieSpecialValue)
        dieSpecialImageView.image = UIImage(named: imageName)
    }
    
    @IBOutlet weak var dieTimerImageView: UIImageView!
    var dieTimerValue = 1;
    @IBAction func dieTimerTouch(sender: AnyObject) {
        dieTimerValue = RollDie()
        let imageName = String(format: "die_timer_%d", dieTimerValue)
        dieTimerImageView.image = UIImage(named: imageName)
    }
    
    @IBOutlet weak var dieTheseusImageView: UIImageView!
    var dieTheseusValue = 1;
    @IBAction func dieTheseusTouch(sender: AnyObject) {
        dieTheseusValue = RollDie()
        let imageName = String(format: "die_theseus_%d", dieTheseusValue)
        dieTheseusImageView.image = UIImage(named: imageName)
    }
    
    
    func RollDie() -> Int {
        return Int(arc4random() % 6) + 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initializeGameTimer()
        
        startRoundButton.setTitle(String(format: "Start Round %d", app.currentRoundNumber), forState: UIControlState.Normal)
    }
    
    @IBAction func startRoundButton(sender: AnyObject) {
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
        startRoundButton.setTitle(String(format: "End Round %d", app.currentRoundNumber), forState: UIControlState.Normal)
        
        initializeRoundTimer()
        startRoundText = false
    }
    
    func finishRound() {
        roundTimer.invalidate()
        
        app.currentRoundNumber++
        startRoundButton.setTitle(String(format: "Start Round %d", app.currentRoundNumber), forState: UIControlState.Normal)
        
        roundTimerLabel.text = String(format: "%02d", app.defaultRoundTime)
        startRoundText = true
    }
    
    func initializeRoundTimer() {
        roundTimerStart = NSDate.timeIntervalSinceReferenceDate()
        updateRoundTime()
    
        let aSelector : Selector = "updateRoundTime"
        roundTimer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: aSelector, userInfo: nil, repeats: true)
    }
    
    func initializeGameTimer() {
        gameTimerStart = NSDate.timeIntervalSinceReferenceDate()
        updateGameTime()
        
        let aSelector : Selector = "updateGameTime"
        gameTimer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: aSelector, userInfo: nil, repeats: true)
    }
    
    func updateRoundTime() {
        let currentTime = NSDate.timeIntervalSinceReferenceDate()
        
        let elapsedTime: NSTimeInterval = currentTime - roundTimerStart
        let roundTimerInSecondsRemaining = app.defaultRoundTime - Int(round(elapsedTime))
        
        let strSeconds = String(format: "%02d", roundTimerInSecondsRemaining)
        roundTimerLabel.text = "\(strSeconds)"
        
        if (roundTimerInSecondsRemaining == 0)
        {
            finishRound()
        }
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
}
