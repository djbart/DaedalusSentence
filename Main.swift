//
//  Main.swift
//  DaedalusSentence
//
//  Created by Bart Waeterschoot on 10/11/15.
//  Copyright © 2015 Cripplefish Games. All rights reserved.
//

import UIKit

class Main: UIViewController {
    let app = UIApplication.sharedApplication().delegate as! AppDelegate
    let borderColor = UIColor(red:0.40, green:0.757, blue:0.898, alpha:1).CGColor /*#68c1e5*/
    
    enum GameSettings {
        case SecondTimeThrough
        case Veteran
        case Expert
        case HellInSpace
        case Custom
    }
    
    @IBOutlet weak var secondTimeThroughButton: UIButton!
    @IBAction func secondTimeThroughButton(sender: AnyObject) {
        initGameSettings(GameSettings.SecondTimeThrough)
    }
    
    @IBOutlet weak var veteranButton: UIButton!
    @IBAction func veteranButton(sender: AnyObject) {
        initGameSettings(GameSettings.Veteran)
    }
    
    @IBOutlet weak var expertButton: UIButton!
    @IBAction func ExpertButton(sender: AnyObject) {
        initGameSettings(GameSettings.Expert)
    }
    
    @IBOutlet weak var hellInSpaceButton: UIButton!
    @IBAction func hellInSpaceButton(sender: AnyObject) {
        initGameSettings(GameSettings.HellInSpace)
    }
    
    @IBOutlet weak var customGameButton: UIButton!
    @IBAction func customGameButton(sender: UIButton) {
        initGameSettings(GameSettings.Custom)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addBorder(secondTimeThroughButton)
        addBorder(veteranButton)
        addBorder(expertButton)
        addBorder(hellInSpaceButton)
        addBorder(customGameButton)
        
        app.currentRoundNumber = 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
    
    func initGameSettings(gameSettings: GameSettings) {
        initDefaultSettings()
        
        switch (gameSettings) {
        case GameSettings.SecondTimeThrough:
            useDifficultyEnhancer1()
            useDifficultyEnhancer3()
        case GameSettings.Veteran:
            useDifficultyEnhancer1()
            useDifficultyEnhancer5()
            useDifficultyEnhancer6()
        case GameSettings.Expert:
            useDifficultyEnhancer1()
            useDifficultyEnhancer3()
            useDifficultyEnhancer4()
        case GameSettings.HellInSpace:
            useDifficultyEnhancer1()
            useDifficultyEnhancer3()
            useDifficultyEnhancer4()
            useDifficultyEnhancer5()
        case GameSettings.Custom:
            useDifficultyEnhancer3()
        }
        
    }
    
    func initDefaultSettings() {
        app.currentRoundNumber = 1
        
        //Game timer settings
        app.gameTimerInSeconds = 3600
        app.useGameTimer = true
        
        //Round timer settings
        app.roundTimerInSeconds = 25
        app.useRoundTimer = false
        
        //Dice settings
        app.useDisabledLocationDie = false
        app.useRoundTimerDie = false
        app.useTheseusCardsDie = false

    }
    
    func useDifficultyEnhancer1() {
        app.useTheseusCardsDie = true
    }
    
    func useDifficultyEnhancer3() {
        app.useGameTimer = true
        app.gameTimerInSeconds = 3600
    }
    
    func useDifficultyEnhancer4() {
        app.useRoundTimerDie = true
    }
    
    func useDifficultyEnhancer5() {
        app.useDisabledLocationDie = true
    }
    
    func useDifficultyEnhancer6() {
        app.useRoundTimer = true
        app.roundTimerInSeconds = 25
    }
}
