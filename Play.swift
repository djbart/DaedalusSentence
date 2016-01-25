import UIKit

class Play: UIViewController {
    
    let app = UIApplication.sharedApplication().delegate as! AppDelegate

    @IBOutlet weak var gameTimerLabel: UILabel!
    var gameTimer: GameTimer!
    
    @IBOutlet weak var gameTimerView: UIView!
    
    @IBOutlet weak var tapDiceLabel: UILabel!
    @IBOutlet weak var roundTimerLabel: UILabel!
    @IBOutlet weak var startRoundButton: DaedalusButton!
    var roundTimer: RoundTimer!
    
    @IBOutlet weak var dieSpecial: DiceView!
    @IBOutlet weak var dieTimer: DiceView!
    @IBOutlet weak var dieTheseus: DiceView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        roundTimer = RoundTimer.init(label: roundTimerLabel, button: startRoundButton)
        
        dieSpecial.imageFileFormat = "die_special_%d"
        dieSpecial.roll()
        dieSpecial.hidden = !app.useDisabledLocationDie
        
        dieTimer.imageFileFormat = "die_timer_%d"
        dieTimer.value.didChange.addHandler(self, handler: Play.dieTimerValueDidChange)
        dieTimer.roll()
        dieTimer.hidden = !app.useRoundTimerDie
        
        dieTheseus.imageFileFormat = "die_theseus_%d"
        dieTheseus.roll()
        dieTheseus.hidden = !app.useTheseusCardsDie
        
        if (!app.useDisabledLocationDie && !app.useRoundTimerDie && !app.useTheseusCardsDie) {
            tapDiceLabel.hidden = true
        }
        
        if (app.useGameTimer)
        {
            gameTimer = GameTimer.init(label: gameTimerLabel)
            gameTimer.start()
        }
        else
        {
            gameTimerView.hidden = true
        }
    }
    
    func dieTimerValueDidChange(oldValue: Int, newValue: Int) {
         roundTimer.setRoundTime((timeInSeconds: 5 * newValue + 10))
    }
    
    @IBAction func startRoundButton(sender: AnyObject) {
        roundTimer.toggleTimer()
        
        if (roundTimer.startRoundText)
        {
            dieSpecial.roll()
            dieTimer.roll()
            dieTheseus.roll()
        }
        
        tapDiceLabel.hidden = !roundTimer.startRoundText
        
        if (roundTimer.startRoundText) {
            dieSpecial.alpha = 1
            dieTimer.alpha = 1
            dieTheseus.alpha = 1
        }
        else {
            dieSpecial.alpha = 0.3
            dieTimer.alpha = 0.3
            dieTheseus.alpha = 0.3
        }
        
        if (!app.useDisabledLocationDie && !app.useRoundTimerDie && !app.useTheseusCardsDie) {
            tapDiceLabel.hidden = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
}
