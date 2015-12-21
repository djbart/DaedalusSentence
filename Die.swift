//
//  Die.swift
//  DaedalusSentence
//
//  Created by Bart Waeterschoot on 21/12/15.
//  Copyright © 2015 Cripplefish Games. All rights reserved.
//

import Foundation
import UIKit

class Die: NSObject {
    let app = UIApplication.sharedApplication().delegate as! AppDelegate
    var image: UIImageView!
    var imageFileFormat: String!
    var value = 1;

    init(image: UIImageView, imageFileFormat: String) {
        self.image = image
        self.imageFileFormat = imageFileFormat
    }
    
    func roll() {
        UIView.animateWithDuration(1.0, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            self.image.alpha = 0.0
            }, completion: nil)
        
        value = Int(arc4random() % 6) + 1
        let imageName = String(format: self.imageFileFormat, value)
        image.image = UIImage(named: imageName)
        
        UIView.animateWithDuration(1.0, delay: 0.0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            self.image.alpha = 1.0
            }, completion: nil)
    }
}