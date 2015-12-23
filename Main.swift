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
    
    @IBOutlet weak var startGameButton: UIButton!
    
    @IBAction func startGameButton(sender: UIButton) {
        app.currentRoundNumber = 1;
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        startGameButton.backgroundColor = UIColor.clearColor()
        startGameButton.layer.cornerRadius = 10
        startGameButton.layer.borderWidth = 2
        startGameButton.layer.borderColor = UIColor(red:0.40, green:0.757, blue:0.898, alpha:1).CGColor /*#68c1e5*/
        
        app.currentRoundNumber = 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
}
