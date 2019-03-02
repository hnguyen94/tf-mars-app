import UIKit

class EnergyView: PropertyView {
    override init() {
        super.init()
        
        self.titleLabel.text = "Energy"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
