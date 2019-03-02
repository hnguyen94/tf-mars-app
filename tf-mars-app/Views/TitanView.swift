import UIKit

class TitanView: PropertyView {
    override init() {
        super.init()
        
        self.titleLabel.text = "Titan"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
