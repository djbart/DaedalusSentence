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
        
        roundTimer.setRoundTime((timeInSeconds: 5 * dieTimerValue + 10))
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

        gameTimer = GameTimer.init(label: gameTimerLabel)
        gameTimer.start()
        
        roundTimer = RoundTimer.init(label: roundTimerLabel, button: startRoundButton)
        roundTimer.setRoundTime((timeInSeconds: 5 * dieTimerValue + 10))
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
