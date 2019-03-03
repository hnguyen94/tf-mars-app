import UIKit

class SteelCell: PropertyCell {
    
    let model = SteelModel()
    
    override init() {
        super.init()
        
        self.titleLabel.text = "Steel"
        productionFactorLabel.text = "Production: \(model.productionFactor)"
        quantityLabel.text = "Quantity: \(model.quantity)"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
