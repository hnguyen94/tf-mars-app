import UIKit

class SteelView: PropertyView {
    override init() {
        super.init()
        
        self.titleLabel.text = "Steel"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
