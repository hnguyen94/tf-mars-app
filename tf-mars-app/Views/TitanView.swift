import UIKit

class TitanView: PropertyView {
    
    let model = TitanModel()
    
    override init() {
        super.init()
        
        titleLabel.text = "Titan"
        productionFactorLabel.text = "Production: \(model.productionFactor)"
        quantityLabel.text = "Quantity: \(model.quantity)"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
