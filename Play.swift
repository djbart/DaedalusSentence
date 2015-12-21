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
    var gameTimer: GameTimer!
    
    @IBOutlet weak var roundTimerLabel: UILabel!
    @IBOutlet weak var startRoundButton: UIButton!
    var roundTimer: RoundTimer!
    
    var dieSpecial: Die!
    @IBOutlet weak var dieSpecialImageView: UIImageView!
    @IBAction func dieSpecialTouch(sender: AnyObject) {
        dieSpecial.roll()
    }
    
    var dieTimer: Die!
    @IBOutlet weak var dieTimerImageView: UIImageView!
    @IBAction func dieTimerTouch(sender: AnyObject) {
        dieTimer.roll()
        roundTimer.setRoundTime((timeInSeconds: 5 * dieTimer.value + 10))
    }
    
    var dieTheseus: Die!
    @IBOutlet weak var dieTheseusImageView: UIImageView!
    @IBAction func dieTheseusTouch(sender: AnyObject) {
        dieTheseus.roll()
    }
    
    
    func RollDie() -> Int {
        return Int(arc4random() % 6) + 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dieSpecial = Die.init(image: dieSpecialImageView, imageFileFormat: "die_special_%d")
        dieSpecial.roll()
        
        dieTimer = Die.init(image: dieTimerImageView, imageFileFormat: "die_timer_%d")
        dieTimer.roll()
        
        dieTheseus = Die.init(image: dieTheseusImageView, imageFileFormat: "die_theseus_%d")
        dieTheseus.roll()
        
        gameTimer = GameTimer.init(label: gameTimerLabel)
        gameTimer.start()
        
        roundTimer = RoundTimer.init(label: roundTimerLabel, button: startRoundButton)
        roundTimer.setRoundTime((timeInSeconds: 5 * dieTimer.value + 10))
    }
    
    @IBAction func startRoundButton(sender: AnyObject) {
        roundTimer.toggleTimer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
}
