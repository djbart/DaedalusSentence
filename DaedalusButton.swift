import UIKit

class DaedalusButton: UIButton{
    // MARK: Constants
    let borderColor = UIColor(red:0.40, green:0.757, blue:0.898, alpha:1).CGColor /*#68c1e5*/
    
    // MARK: Initialization
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        backgroundColor = UIColor.clearColor()
        layer.cornerRadius = 10
        layer.borderWidth = 2
        layer.borderColor = borderColor
    }
}
