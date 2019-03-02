import UIKit

class MoneyView: PropertyView {
    override init() {
        super.init()
        
        self.titleLabel.text = "Mega Credits"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
