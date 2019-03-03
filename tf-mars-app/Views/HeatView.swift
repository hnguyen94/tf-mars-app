import UIKit

class HeatView: PropertyView {
    
    let model = HeatModel()
    
    override init() {
        super.init()
        
        titleLabel.text = "Heat"
        productionFactorLabel.text = "Production: \(model.productionFactor)"
        quantityLabel.text = "Quantity: \(model.quantity)"
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
