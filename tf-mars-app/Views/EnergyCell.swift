import UIKit

class EnergyCell: PropertyCell {
    
    let model = EnergyModel()
    
    override init() {
        super.init()
        
        titleLabel.text = "Energy"
        productionFactorLabel.text = "Production: \(model.productionFactor)"
        quantityLabel.text = "Quantity: \(model.quantity)"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
