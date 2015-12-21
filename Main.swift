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
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
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
        SwitchPlayerSelection(&PlayerRedAvatarImageView, selection: &PlayerRedSelectedImageView, selected: &appDelegate.PlayerRedSelected)
    }
    
    @IBAction func PlayerYellowButtonTouched(sender: UIButton) {
        SwitchPlayerSelection(&PlayerYellowAvatarImageView, selection: &PlayerYellowSelectedImageView, selected: &appDelegate.PlayerYellowSelected)
    }
    
    
    @IBAction func PlayerBlueButtonTouched(sender: UIButton) {
        SwitchPlayerSelection(&PlayerBlueAvatarImageView, selection: &PlayerBlueSelectedImageView, selected: &appDelegate.PlayerBlueSelected)
    }
    
    @IBAction func PlayerGreenButtonTouched(sender: UIButton) {
        SwitchPlayerSelection(&PlayerGreenAvatarImageView, selection: &PlayerGreenSelectedImageView, selected: &appDelegate.PlayerGreenSelected)
    }
    
    @IBAction func PlayerPurpleButtonTouched(sender: UIButton) {
        SwitchPlayerSelection(&PlayerPurpleAvatarImageView, selection: &PlayerPurpleSelectedImageView, selected: &appDelegate.PlayerPurpleSelected)
    }
    
    @IBAction func PlayerOverlordButtonTouched(sender: UIButton) {
        SwitchPlayerSelection(&PlayerOverlordAvatarImageView, selection: &PlayerOverlordSelectedImageView, selected: &appDelegate.PlayerOverlordSelected)
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

        // Do any additional setup once after loading the view.
        InitializePlayerSelection()
            
        UIApplication.sharedApplication().idleTimerDisabled = true
    }
    
    func InitializePlayerSelection()
    {
        SetPlayerSelection(&PlayerRedAvatarImageView, selection: &PlayerRedSelectedImageView, selected: &appDelegate.PlayerRedSelected)
        SetPlayerSelection(&PlayerYellowAvatarImageView, selection: &PlayerYellowSelectedImageView, selected: &appDelegate.PlayerYellowSelected)
        SetPlayerSelection(&PlayerBlueAvatarImageView, selection: &PlayerBlueSelectedImageView, selected: &appDelegate.PlayerBlueSelected)
        SetPlayerSelection(&PlayerGreenAvatarImageView, selection: &PlayerGreenSelectedImageView, selected: &appDelegate.PlayerGreenSelected)
        SetPlayerSelection(&PlayerPurpleAvatarImageView, selection: &PlayerPurpleSelectedImageView, selected: &appDelegate.PlayerPurpleSelected)
        SetPlayerSelection(&PlayerOverlordAvatarImageView, selection: &PlayerOverlordSelectedImageView, selected: &appDelegate.PlayerOverlordSelected)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
