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
    let checkedImageName = "checked-button"
    let uncheckedImageName = "unchecked-button"
    
    @IBOutlet weak var gameTimerButton: UIButton!
    @IBAction func gameTimerTouched(sender: AnyObject) {
        toggle(gameTimerButton, selected: &app.useGameTimer)
    }

    @IBOutlet weak var roundTimerButton: UIButton!
    @IBAction func roundTimerTouched(sender: AnyObject) {
        toggle(roundTimerButton, selected: &app.useRoundTimer)
    }
    
    @IBOutlet weak var disabledLocationButton: UIButton!
    @IBAction func disabledLocationTouched(sender: AnyObject) {
        toggle(disabledLocationButton, selected: &app.useDisabledLocationDie)
    }
    
    @IBOutlet weak var roundTimeButton: UIButton!
    @IBAction func roundTimeTouched(sender: AnyObject) {
        toggle(roundTimeButton, selected: &app.useRoundTimerDie)
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
}
