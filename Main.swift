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
    @IBOutlet weak var PlayerRedAvatarImageView: UIImageView!
    @IBOutlet weak var PlayerRedSelectedImageView: UIImageView!
    
    @IBOutlet weak var PlayerYellowAvatarImageView: UIImageView!
    @IBOutlet weak var PlayerYellowSelectedImageView: UIImageView!
    
    @IBOutlet weak var PlayerBlueAvatarImageView: UIImageView!
    @IBOutlet weak var PlayerBlueSelectedImageView: UIImageView!
    
    @IBOutlet weak var PlayerGreenAvatarImageView: UIImageView!
    @IBOutlet weak var PlayerGreenSelectedImageView: UIImageView!
    
    @IBOutlet weak var PlayerPurpleAvatarImageView: UIImageView!
    @IBOutlet weak var PlayerPurpleSelectedImageView: UIImageView!
    
    @IBOutlet weak var PlayerOverlordAvatarImageView: UIImageView!
    @IBOutlet weak var PlayerOverlordSelectedImageView: UIImageView!
    
    @IBAction func PlayerRedButtonTouched(sender: UIButton) {
        SwitchPlayerSelection(&PlayerRedAvatarImageView, selection: &PlayerRedSelectedImageView, selected: &app.PlayerRedSelected)
    }
    
    @IBAction func PlayerYellowButtonTouched(sender: UIButton) {
        SwitchPlayerSelection(&PlayerYellowAvatarImageView, selection: &PlayerYellowSelectedImageView, selected: &app.PlayerYellowSelected)
    }
    
    
    @IBAction func PlayerBlueButtonTouched(sender: UIButton) {
        SwitchPlayerSelection(&PlayerBlueAvatarImageView, selection: &PlayerBlueSelectedImageView, selected: &app.PlayerBlueSelected)
    }
    
    @IBAction func PlayerGreenButtonTouched(sender: UIButton) {
        SwitchPlayerSelection(&PlayerGreenAvatarImageView, selection: &PlayerGreenSelectedImageView, selected: &app.PlayerGreenSelected)
    }
    
    @IBAction func PlayerPurpleButtonTouched(sender: UIButton) {
        SwitchPlayerSelection(&PlayerPurpleAvatarImageView, selection: &PlayerPurpleSelectedImageView, selected: &app.PlayerPurpleSelected)
    }
    
    @IBAction func PlayerOverlordButtonTouched(sender: UIButton) {
        SwitchPlayerSelection(&PlayerOverlordAvatarImageView, selection: &PlayerOverlordSelectedImageView, selected: &app.PlayerOverlordSelected)
    }
    
    @IBAction func startGameButton(sender: UIButton) {
        app.currentRoundNumber = 1;
    }
    
    
    func SwitchPlayerSelection(inout avatar: UIImageView!, inout selection: UIImageView!, inout selected: Bool)
    {
        if (selected == true)
        {
            avatar.alpha = deselectedAplhaValue
            selection.hidden = true
            selected = false
        }
        else
        {
            avatar.alpha = 1
            selection.hidden = false
            selected = true
        }
    }
    
    func SetPlayerSelection(inout avatar: UIImageView!, inout selection: UIImageView!, inout selected: Bool)
    {
        if (selected == true)
        {
            avatar.alpha = 1
            selection.hidden = false
        }
        else
        {
            avatar.alpha = deselectedAplhaValue
            selection.hidden = true
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        InitializePlayerSelection()
    }
    
    func InitializePlayerSelection()
    {
        SetPlayerSelection(&PlayerRedAvatarImageView, selection: &PlayerRedSelectedImageView, selected: &app.PlayerRedSelected)
        SetPlayerSelection(&PlayerYellowAvatarImageView, selection: &PlayerYellowSelectedImageView, selected: &app.PlayerYellowSelected)
        SetPlayerSelection(&PlayerBlueAvatarImageView, selection: &PlayerBlueSelectedImageView, selected: &app.PlayerBlueSelected)
        SetPlayerSelection(&PlayerGreenAvatarImageView, selection: &PlayerGreenSelectedImageView, selected: &app.PlayerGreenSelected)
        SetPlayerSelection(&PlayerPurpleAvatarImageView, selection: &PlayerPurpleSelectedImageView, selected: &app.PlayerPurpleSelected)
        SetPlayerSelection(&PlayerOverlordAvatarImageView, selection: &PlayerOverlordSelectedImageView, selected: &app.PlayerOverlordSelected)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
}
