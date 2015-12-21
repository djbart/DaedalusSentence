//
//  Avatar.swift
//  DaedalusSentence
//
//  Created by Bart Waeterschoot on 21/12/15.
//  Copyright © 2015 Cripplefish Games. All rights reserved.
//

import Foundation
import UIKit

class Avatar: NSObject {
    let deselectedAplhaValue: CGFloat = 0.5
    let app = UIApplication.sharedApplication().delegate as! AppDelegate
    
    var avatarImage: UIImageView!
    var avatarSelection: UIImageView!
    var selected: UnsafeMutablePointer<Bool>
    
    init(image: UIImageView, selection: UIImageView, selected: UnsafeMutablePointer<Bool>) {
        self.avatarImage = image
        self.avatarSelection = selection
        self.selected = selected
        
        if (self.selected.memory == true)
        {
            avatarImage.alpha = 1
            avatarSelection.hidden = false
        }
        else
        {
            avatarImage.alpha = deselectedAplhaValue
            avatarSelection.hidden = true
        }
    }
    
    func toggle() {
        if (selected.memory == true)
        {
            avatarImage.alpha = deselectedAplhaValue
            avatarSelection.hidden = true
            selected.memory = false
        }
        else
        {
            avatarImage.alpha = 1
            avatarSelection.hidden = false
            selected.memory = true
        }
    }
    
    func set(selected: Bool) {
        if (selected == true)
        {
            avatarImage.alpha = 1
            avatarSelection.hidden = false
            self.selected.memory = true
        }
        else
        {
            avatarImage.alpha = deselectedAplhaValue
            avatarSelection.hidden = true
            self.selected.memory = false
        }
    }
}
