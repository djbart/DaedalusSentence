//
//  Settings.swift
//  DaedalusSentence
//
//  Created by Bart Waeterschoot on 21/12/15.
//  Copyright © 2015 Cripplefish Games. All rights reserved.
//

import UIKit

class Settings: UIViewController {
    let app = UIApplication.sharedApplication().delegate as! AppDelegate
    let borderColor = UIColor(red:0.40, green:0.757, blue:0.898, alpha:1).CGColor /*#68c1e5*/
    
    let checkedImageName = "checked-button"
    let uncheckedImageName = "unchecked-button"
    let gameTimerMin = 600
    let gameTimerMax = 7200
    let gameTimerIncrement = 300
    
    let roundTimerMin = 10
    let roundTimerMax = 60
    let roundTimerIncrement = 5
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var gameTimerButton: UIButton!
    @IBOutlet weak var gameTimerLabel: UILabel!
    @IBOutlet weak var gameTimerView: UIView!
    @IBAction func gameTimerTouched(sender: AnyObject) {
        toggle(gameTimerButton, selected: &app.useGameTimer)
        gameTimerView.hidden = !app.useGameTimer
    }
    
    @IBAction func gameTimerPreviousTouched(sender: AnyObject) {
        if (app.gameTimerInSeconds > gameTimerMin) {
            app.gameTimerInSeconds = app.gameTimerInSeconds - gameTimerIncrement
        }
        
        gameTimerLabel.text = String(format: "%d min", app.gameTimerInSeconds / 60)
    }
    
    @IBAction func gameTimerNextTouched(sender: AnyObject) {
        if (app.gameTimerInSeconds < gameTimerMax) {
            app.gameTimerInSeconds = app.gameTimerInSeconds + gameTimerIncrement
        }
        
        gameTimerLabel.text = String(format: "%d min", app.gameTimerInSeconds / 60)
    }

    @IBOutlet weak var roundTimerButton: UIButton!
    @IBOutlet weak var roundTimerLabel: UILabel!
    @IBOutlet weak var roundTimerView: UIView!
    @IBAction func roundTimerTouched(sender: AnyObject) {
        toggle(roundTimerButton, selected: &app.useRoundTimer)
        roundTimerView.hidden = !app.useRoundTimer
        
        if (app.useRoundTimer) {
            app.useRoundTimerDie = false
            
            set(roundTimeButton, selected: app.useRoundTimerDie)
        }
    }
    
    @IBAction func roundTimerPreviousTouched(sender: AnyObject) {
        if (app.roundTimerInSeconds > roundTimerMin) {
            app.roundTimerInSeconds = app.roundTimerInSeconds - roundTimerIncrement
        }
        
        roundTimerLabel.text = String(format: "%d sec", app.roundTimerInSeconds)
    }
    
    @IBAction func roundTimerNextTouched(sender: AnyObject) {
        if (app.roundTimerInSeconds < roundTimerMax) {
            app.roundTimerInSeconds = app.roundTimerInSeconds + roundTimerIncrement
        }
        
        roundTimerLabel.text = String(format: "%d sec", app.roundTimerInSeconds)
    }
    
    @IBOutlet weak var disabledLocationButton: UIButton!
    @IBAction func disabledLocationTouched(sender: AnyObject) {
        toggle(disabledLocationButton, selected: &app.useDisabledLocationDie)
    }
    
    @IBOutlet weak var roundTimeButton: UIButton!
    @IBAction func roundTimeTouched(sender: AnyObject) {
        toggle(roundTimeButton, selected: &app.useRoundTimerDie)
        
        if (app.useRoundTimerDie) {
            app.useRoundTimer = false
            
            set(roundTimerButton, selected: app.useRoundTimer)
            roundTimerView.hidden = !app.useRoundTimer
        }

    }
    
    @IBOutlet weak var theseusCardsButton: UIButton!
    @IBAction func theseusCardsTouched(sender: AnyObject) {
        toggle(theseusCardsButton, selected: &app.useTheseusCardsDie)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        set(gameTimerButton, selected: app.useGameTimer)
        set(roundTimerButton, selected: app.useRoundTimer)
        set(disabledLocationButton, selected: app.useDisabledLocationDie)
        set(roundTimeButton, selected: app.useRoundTimerDie)
        set(theseusCardsButton, selected: app.useTheseusCardsDie)
        
        gameTimerLabel.text = String(format: "%d min", app.gameTimerInSeconds / 60)
        roundTimerLabel.text = String(format: "%d sec", app.roundTimerInSeconds)
        
        gameTimerView.hidden = !app.useGameTimer
        roundTimerView.hidden = !app.useRoundTimer
        
        addBorder(startButton)
    }
    
    func toggle(button: UIButton, selected: UnsafeMutablePointer<Bool>) {
        if (selected.memory){
            button.setImage(UIImage(named: uncheckedImageName), forState: UIControlState.Normal)
            selected.memory = false
        }
        else {
            button.setImage(UIImage(named: checkedImageName), forState: UIControlState.Normal)
            selected.memory = true
        }
    }
    
    func set(button: UIButton, selected: Bool) {
        if (selected){
            button.setImage(UIImage(named: checkedImageName), forState: UIControlState.Normal)
        }
        else {
            button.setImage(UIImage(named: uncheckedImageName), forState: UIControlState.Normal)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    func addBorder(button: UIButton) {
        button.backgroundColor = UIColor.clearColor()
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 2
        button.layer.borderColor = borderColor
    }
}
