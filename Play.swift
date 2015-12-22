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
    
    @IBOutlet weak var gameTimerView: UIView!
    
    @IBOutlet weak var tapDiceLabel: UILabel!
    @IBOutlet weak var roundTimerLabel: UILabel!
    @IBOutlet weak var startRoundButton: UIButton!
    var roundTimer: RoundTimer!
    
    var dieSpecial: Die!
    @IBOutlet weak var dieSpecialImageView: UIImageView!
    @IBOutlet weak var dieSpecialButton: UIButton!
    @IBAction func dieSpecialTouch(sender: AnyObject) {
        dieSpecial.roll()
    }
    
    var dieTimer: Die!
    @IBOutlet weak var dieTimerImageView: UIImageView!
    @IBOutlet weak var dieTimerButton: UIButton!
    @IBAction func dieTimerTouch(sender: AnyObject) {
        dieTimer.roll()
        roundTimer.setRoundTime((timeInSeconds: 5 * dieTimer.value + 10))
    }
    
    var dieTheseus: Die!
    @IBOutlet weak var dieTheseusImageView: UIImageView!
    @IBOutlet weak var dieTheseusButton: UIButton!
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
        dieSpecialImageView.hidden = !app.useDisabledLocationDie
        dieSpecialButton.enabled = app.useDisabledLocationDie
        
        dieTimer = Die.init(image: dieTimerImageView, imageFileFormat: "die_timer_%d")
        dieTimer.roll()
        dieTimerImageView.hidden = !app.useRoundTimerDie
        dieTimerButton.enabled = app.useRoundTimerDie
        
        dieTheseus = Die.init(image: dieTheseusImageView, imageFileFormat: "die_theseus_%d")
        dieTheseus.roll()
        dieTheseusImageView.hidden = !app.useTheseusCardsDie
        dieTheseusButton.enabled = app.useTheseusCardsDie
        
        if (!app.useDisabledLocationDie && !app.useRoundTimerDie && !app.useTheseusCardsDie) {
            tapDiceLabel.hidden = true
        }
        
        if (app.useGameTimer)
        {
            gameTimer = GameTimer.init(label: gameTimerLabel)
            gameTimer.start()
        }
        else
        {
            gameTimerView.hidden = true
        }
        
        roundTimer = RoundTimer.init(label: roundTimerLabel, button: startRoundButton)
        roundTimer.setRoundTime((timeInSeconds: 5 * dieTimer.value + 10))
        
        startRoundButton.backgroundColor = UIColor.clearColor()
        startRoundButton.layer.cornerRadius = 10
        startRoundButton.layer.borderWidth = 2
        startRoundButton.layer.borderColor = UIColor(red:0.40, green:0.757, blue:0.898, alpha:1).CGColor /*#68c1e5*/
        
        finishButton.backgroundColor = UIColor.clearColor()
        finishButton.layer.cornerRadius = 10
        finishButton.layer.borderWidth = 2
        finishButton.layer.borderColor = UIColor(red:0.40, green:0.757, blue:0.898, alpha:1).CGColor /*#68c1e5*/
        
        quitButton.backgroundColor = UIColor.clearColor()
        quitButton.layer.cornerRadius = 10
        quitButton.layer.borderWidth = 2
        quitButton.layer.borderColor = UIColor(red:0.40, green:0.757, blue:0.898, alpha:1).CGColor /*#68c1e5*/
    }
    
    @IBAction func startRoundButton(sender: AnyObject) {
        roundTimer.toggleTimer()
        
        if (roundTimer.startRoundText)
        {
            dieSpecial.roll()
            dieTimer.roll()
            dieTheseus.roll()
            
            roundTimer.setRoundTime((timeInSeconds: 5 * dieTimer.value + 10))
        }
        
        dieSpecialButton.enabled = roundTimer.startRoundText
        dieTimerButton.enabled = roundTimer.startRoundText
        dieTheseusButton.enabled = roundTimer.startRoundText
        tapDiceLabel.hidden = !roundTimer.startRoundText
        
        if (roundTimer.startRoundText) {
            dieSpecialImageView.alpha = 1
            dieTimerImageView.alpha = 1
            dieTheseusImageView.alpha = 1
        }
        else {
            dieSpecialImageView.alpha = 0.3
            dieTimerImageView.alpha = 0.3
            dieTheseusImageView.alpha = 0.3
        }
        
        if (!app.useDisabledLocationDie && !app.useRoundTimerDie && !app.useTheseusCardsDie) {
            tapDiceLabel.hidden = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
}
