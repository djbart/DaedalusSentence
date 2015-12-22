//
//  Main.swift
//  DaedalusSentence
//
//  Created by Bart Waeterschoot on 10/11/15.
//  Copyright © 2015 Cripplefish Games. All rights reserved.
//

import UIKit

class Main: UIViewController {
    
    let deselectedAplhaValue: CGFloat = 0.5
    let app = UIApplication.sharedApplication().delegate as! AppDelegate
    
    @IBOutlet weak var startGameButton: UIButton!
    
    var PlayerRed: Avatar!
    @IBOutlet weak var PlayerRedAvatarImageView: UIImageView!
    @IBOutlet weak var PlayerRedSelectedImageView: UIImageView!
    
    var PlayerYellow: Avatar!
    @IBOutlet weak var PlayerYellowAvatarImageView: UIImageView!
    @IBOutlet weak var PlayerYellowSelectedImageView: UIImageView!
    
    var PlayerBlue: Avatar!
    @IBOutlet weak var PlayerBlueAvatarImageView: UIImageView!
    @IBOutlet weak var PlayerBlueSelectedImageView: UIImageView!
    
    var PlayerGreen: Avatar!
    @IBOutlet weak var PlayerGreenAvatarImageView: UIImageView!
    @IBOutlet weak var PlayerGreenSelectedImageView: UIImageView!
    
    var PlayerPurple: Avatar!
    @IBOutlet weak var PlayerPurpleAvatarImageView: UIImageView!
    @IBOutlet weak var PlayerPurpleSelectedImageView: UIImageView!
    
    var PlayerOverlord: Avatar!
    @IBOutlet weak var PlayerOverlordAvatarImageView: UIImageView!
    @IBOutlet weak var PlayerOverlordSelectedImageView: UIImageView!
    
    @IBAction func PlayerRedButtonTouched(sender: UIButton) {
        PlayerRed.toggle()
    }
    
    @IBAction func PlayerYellowButtonTouched(sender: UIButton) {
        PlayerYellow.toggle()
    }
    
    @IBAction func PlayerBlueButtonTouched(sender: UIButton) {
        PlayerBlue.toggle()
    }
    
    @IBAction func PlayerGreenButtonTouched(sender: UIButton) {
        PlayerGreen.toggle()
    }
    
    @IBAction func PlayerPurpleButtonTouched(sender: UIButton) {
        PlayerPurple.toggle()
    }
    
    @IBAction func PlayerOverlordButtonTouched(sender: UIButton) {
        PlayerOverlord.toggle()
    }
    
    @IBAction func startGameButton(sender: UIButton) {
        app.currentRoundNumber = 1;
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        InitializePlayerSelection()
        
        startGameButton.backgroundColor = UIColor.clearColor()
        startGameButton.layer.cornerRadius = 10
        startGameButton.layer.borderWidth = 2
        startGameButton.layer.borderColor = UIColor(red:0.40, green:0.757, blue:0.898, alpha:1).CGColor /*#68c1e5*/
        
        app.currentRoundNumber = 1
    }
    
    func InitializePlayerSelection()
    {
        PlayerRed = Avatar.init(image: PlayerRedAvatarImageView, selection: PlayerRedSelectedImageView, selected: &app.PlayerRedSelected)
        PlayerYellow = Avatar.init(image: PlayerYellowAvatarImageView, selection: PlayerYellowSelectedImageView, selected: &app.PlayerYellowSelected)
        PlayerBlue = Avatar.init(image: PlayerBlueAvatarImageView, selection: PlayerBlueSelectedImageView, selected: &app.PlayerBlueSelected)
        PlayerGreen = Avatar.init(image: PlayerGreenAvatarImageView, selection: PlayerGreenSelectedImageView, selected: &app.PlayerGreenSelected)
        PlayerPurple = Avatar.init(image: PlayerPurpleAvatarImageView, selection: PlayerPurpleSelectedImageView, selected: &app.PlayerPurpleSelected)
        PlayerOverlord = Avatar.init(image: PlayerOverlordAvatarImageView, selection: PlayerOverlordSelectedImageView, selected: &app.PlayerOverlordSelected)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
}
