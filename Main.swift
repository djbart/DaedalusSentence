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
    
    
    @IBOutlet weak var PlayerRedAvatarImageView: UIImageView!
    @IBOutlet weak var PlayerRedSelectedImageView: UIImageView!
    var PlayerRedSelected = false
    
    
    @IBOutlet weak var PlayerYellowAvatarImageView: UIImageView!
    @IBOutlet weak var PlayerYellowSelectedImageView: UIImageView!
    var PlayerYellowSelected = false
    
    @IBOutlet weak var PlayerBlueAvatarImageView: UIImageView!
    @IBOutlet weak var PlayerBlueSelectedImageView: UIImageView!
    var PlayerBlueSelected = false
    
    
    @IBOutlet weak var PlayerGreenAvatarImageView: UIImageView!
    @IBOutlet weak var PlayerGreenSelectedImageView: UIImageView!
    var PlayerGreenSelected = false
    
    @IBOutlet weak var PlayerPurpleAvatarImageView: UIImageView!
    @IBOutlet weak var PlayerPurpleSelectedImageView: UIImageView!
    var PlayerPurpleSelected = false
    
    @IBOutlet weak var PlayerOverlordAvatarImageView: UIImageView!
    @IBOutlet weak var PlayerOverlordSelectedImageView: UIImageView!
    var PlayerOverlordSelected = false
    
    @IBAction func PlayerRedButtonTouched(sender: UIButton) {
        UpdatePlayerSelection(&PlayerRedAvatarImageView, selection: &PlayerRedSelectedImageView, selected: &PlayerRedSelected)
    }
    
    @IBAction func PlayerYellowButtonTouched(sender: UIButton) {
        UpdatePlayerSelection(&PlayerYellowAvatarImageView, selection: &PlayerYellowSelectedImageView, selected: &PlayerYellowSelected)
    }
    
    
    @IBAction func PlayerBlueButtonTouched(sender: UIButton) {
        UpdatePlayerSelection(&PlayerBlueAvatarImageView, selection: &PlayerBlueSelectedImageView, selected: &PlayerBlueSelected)
    }
    
    @IBAction func PlayerGreenButtonTouched(sender: UIButton) {
        UpdatePlayerSelection(&PlayerGreenAvatarImageView, selection: &PlayerGreenSelectedImageView, selected: &PlayerGreenSelected)
    }
    
    @IBAction func PlayerPurpleButtonTouched(sender: UIButton) {
        UpdatePlayerSelection(&PlayerPurpleAvatarImageView, selection: &PlayerPurpleSelectedImageView, selected: &PlayerPurpleSelected)
    }
    
    @IBAction func PlayerOverlordButtonTouched(sender: UIButton) {
        UpdatePlayerSelection(&PlayerOverlordAvatarImageView, selection: &PlayerOverlordSelectedImageView, selected: &PlayerOverlordSelected)
    }
    
    
    func UpdatePlayerSelection(inout avatar: UIImageView!, inout selection: UIImageView!, inout selected: Bool)
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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        PlayerRedAvatarImageView.alpha = deselectedAplhaValue
        PlayerYellowAvatarImageView.alpha = deselectedAplhaValue
        PlayerBlueAvatarImageView.alpha = deselectedAplhaValue
        PlayerGreenAvatarImageView.alpha = deselectedAplhaValue
        PlayerPurpleAvatarImageView.alpha = deselectedAplhaValue
        PlayerOverlordAvatarImageView.alpha = deselectedAplhaValue
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
