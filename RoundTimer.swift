import AVFoundation
import Foundation
import UIKit

class RoundTimer: NSObject {
    let app = UIApplication.sharedApplication().delegate as! AppDelegate
    
    var audioPlayer = AVAudioPlayer()
    
    var roundTimerStart = NSTimeInterval()
    var roundTimer = NSTimer()
    var startRoundText = true
    
    var timerLabel = UILabel()
    var timerButton = UIButton()
    var roundTimeInSeconds: Int!
    
    init(label: UILabel, button: UIButton) {
        self.timerLabel = label
        self.timerButton = button
        
        timerButton.setTitle(String(format: "Start Round %d", app.currentRoundNumber), forState: UIControlState.Normal)
    }
    
    func setRoundTime(timeInSeconds: Int) {
        roundTimeInSeconds = timeInSeconds
        updateLabel(roundTimeInSeconds)
        timerLabel.alpha = 0.3
    }
    
    func toggleTimer() {
        if (startRoundText == true)
        {
            startRound()
        }
        else
        {
            finishRound()
        }
    }
    
    func startRound(){
        timerButton.setTitle(String(format: "End Round %d", app.currentRoundNumber), forState: UIControlState.Normal)
        
        let path = NSBundle.mainBundle().URLForResource("Thomas", withExtension: "mp3")
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOfURL: path!)
        }
        catch {
            
        }
        
        if (roundTimeInSeconds == 40)
        {
            audioPlayer.prepareToPlay()
            audioPlayer.currentTime = 0
            audioPlayer.playAtTime(5)
        }
        else
        {
            audioPlayer.currentTime = Double(35 - roundTimeInSeconds)
            audioPlayer.prepareToPlay()
            audioPlayer.play()
        }
        
        fadePlayer(audioPlayer, fromVolume: 0.0, toVolume: 1.0, overTime: 1.0)
        
        initializeRoundTimer()
        startRoundText = false
        timerLabel.alpha = 1
    }
    
    func finishRound() {
        roundTimer.invalidate()
        
        app.currentRoundNumber++
        timerButton.setTitle(String(format: "Start Round %d", app.currentRoundNumber), forState: UIControlState.Normal)
        
        updateLabel(roundTimeInSeconds)
        
        audioPlayer.stop()
        audioPlayer.currentTime = 0
        
        startRoundText = true
        timerLabel.alpha = 0.3
    }
    
    func initializeRoundTimer() {
        roundTimerStart = NSDate.timeIntervalSinceReferenceDate()
        updateRoundTime()
        
        timerLabel.alpha = 0.3
        
        let aSelector : Selector = "updateRoundTime"
        roundTimer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: aSelector, userInfo: nil, repeats: true)
    }
    
    func updateRoundTime() {
        let currentTime = NSDate.timeIntervalSinceReferenceDate()
        
        let elapsedTime: NSTimeInterval = currentTime - roundTimerStart
        let roundTimerInSecondsRemaining = roundTimeInSeconds - Int(round(elapsedTime))
        
        updateLabel(roundTimerInSecondsRemaining)
        
        if (roundTimerInSecondsRemaining <= 0)
        {
            finishRound()
        }
    }

    func updateLabel (roundTime: Int) {
        let hours = UInt8(roundTime / 3600)
        let minutes = UInt8(roundTime % 3600 / 60)
        let seconds = UInt8(roundTime % 3600 % 60)
        
        let strHours = String(format: "%02d", hours)
        let strMinutes = String(format: "%02d", minutes)
        let strSeconds = String(format: "%02d", seconds)
        
        timerLabel.text = "\(strHours):\(strMinutes):\(strSeconds)"
    }
    
    func fadePlayer(player: AVAudioPlayer,
        fromVolume startVolume : Float,
        toVolume endVolume : Float,
        overTime time : Float) {
            
            // Update the volume every 1/100 of a second
            let fadeSteps : Int = Int(time) * 100
            // Work out how much time each step will take
            let timePerStep : Float = 1 / 100.0
            
            player.volume = startVolume;
            
            // Schedule a number of volume changes
            for step in 0...fadeSteps {
                let delayInSeconds : Float = Float(step) * timePerStep
                
                let popTime = dispatch_time(DISPATCH_TIME_NOW,
                    Int64(delayInSeconds * Float(NSEC_PER_SEC)));
                dispatch_after(popTime, dispatch_get_main_queue()) {
                    
                    let fraction = (Float(step) / Float(fadeSteps))
                    
                    player.volume = startVolume +
                        (endVolume - startVolume) * fraction
                    
                }
            }
    }
}