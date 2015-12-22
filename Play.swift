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
    
    @IBOutlet weak var finishButton: UIButton!
    @IBOutlet weak var quitButton: UIButton!
    
    
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
        
        startRoundButton.backgroundColor = UIColor.clearColor()
        startRoundButton.layer.cornerRadius = 10
        startRoundButton.layer.borderWidth = 2
        startRoundButton.layer.borderColor = UIColor(red:0.40, green:0.757, blue:0.898, alpha:1).CGColor /*#68c1e5*/
        
        finishButton.backgroundColor = UIColor.clearColor()
        finishButton.layer.cornerRadius = 10
        finishButton.layer.borderWidth = 2
        finishButton.layer.borderColor = UIColor.greenColor().CGColor
        
        quitButton.backgroundColor = UIColor.clearColor()
        quitButton.layer.cornerRadius = 10
        quitButton.layer.borderWidth = 2
        quitButton.layer.borderColor = UIColor.redColor().CGColor
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
