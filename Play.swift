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
    
    @IBOutlet weak var dieSpecial: DiceControl!
    @IBOutlet weak var dieTimer: DiceControl!
    @IBOutlet weak var dieTheseus: DiceControl!
    
    @IBOutlet weak var finishButton: UIButton!
    @IBOutlet weak var quitButton: UIButton!
    
    
    func RollDie() -> Int {
        return Int(arc4random() % 6) + 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dieSpecial.imageFileFormat = "die_special_%d"
        dieSpecial.roll()
        dieSpecial.hidden = !app.useDisabledLocationDie
        
        dieTimer.imageFileFormat = "die_timer_%d"
        dieTimer.roll()
        dieTimer.hidden = !app.useRoundTimerDie
        
        dieTheseus.imageFileFormat = "die_theseus_%d"
        dieTheseus.hidden = !app.useTheseusCardsDie
        dieTheseus.roll()
        
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
            roundTimer.setRoundTime((timeInSeconds: 5 * dieTimer.value + 10))
            dieTheseus.roll()
            
            roundTimer.setRoundTime((timeInSeconds: 5 * dieTimer.value + 10))
        }
        
        tapDiceLabel.hidden = !roundTimer.startRoundText
        
        if (roundTimer.startRoundText) {
            dieSpecial.alpha = 1
            dieTimer.alpha = 1
            dieTheseus.alpha = 1
        }
        else {
            dieSpecial.alpha = 0.3
            dieTimer.alpha = 0.3
            dieTheseus.alpha = 0.3
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
