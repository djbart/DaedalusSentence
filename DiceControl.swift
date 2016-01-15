import UIKit

class DiceControl: UIView {
    // MARK: Constants
    let borderColor = UIColor(red:0.40, green:0.757, blue:0.898, alpha:1).CGColor /*#68c1e5*/
    
    // MARK: Properties
    var image: UIImageView!
    var button: UIButton!
    var imageFileFormat: String!
    var value = 1;
    
    // MARK: Initialization
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        image = UIImageView()
        addSubview(image)
        
        button = UIButton()
        button.addTarget(self, action: "buttonTapped:", forControlEvents: .TouchUpInside)
        addSubview(button)
    }
    
    override func layoutSubviews() {
        let frameHeight = Int(frame.size.height)
        let frameWidth = Int(frame.size.width)
        
        image.frame = CGRect(x: 5, y: 5, width: frameWidth - 10, height: frameHeight - 10)
        
        button.frame = CGRect(x: 0, y: 0, width: frameWidth, height: frameHeight)
        button.backgroundColor = UIColor.clearColor()
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 2
        button.layer.borderColor = borderColor
    }
    
    override func intrinsicContentSize() -> CGSize {
        return CGSize(width: 80, height: 80)
    }
    
    // MARK: Button Action
    func buttonTapped(button: UIButton) {
        roll()
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
