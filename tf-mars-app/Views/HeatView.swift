import UIKit

class HeatView: PropertyView {
    override init() {
        super.init()
        
        self.titleLabel.text = "Heat"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
