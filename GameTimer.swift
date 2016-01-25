import Foundation
import UIKit

class GameTimer: NSObject {
    let app = UIApplication.sharedApplication().delegate as! AppDelegate
    
    var startTime = NSTimeInterval()
    var timer = NSTimer()
    var timerLabel = UILabel()
    
    init(label: UILabel) {
        self.timerLabel = label
    }
    
    func start() {
        startTime = NSDate.timeIntervalSinceReferenceDate()
        updateTimer()
        
        let aSelector : Selector = "updateTimer"
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: aSelector, userInfo: nil, repeats: true)
    }
    
    func updateTimer() {
        let currentTime = NSDate.timeIntervalSinceReferenceDate()
        
        let elapsedTime: NSTimeInterval = currentTime - startTime
        let totalSecondsRemaining = app.gameTimerInSeconds - Int(round(elapsedTime))
        
        let hours = UInt8(totalSecondsRemaining / 3600)
        let minutes = UInt8(totalSecondsRemaining % 3600 / 60)
        let seconds = UInt8(totalSecondsRemaining % 3600 % 60)
        
        let strHours = String(format: "%02d", hours)
        let strMinutes = String(format: "%02d", minutes)
        let strSeconds = String(format: "%02d", seconds)
        
        timerLabel.text = "\(strHours):\(strMinutes):\(strSeconds)"
    }
}