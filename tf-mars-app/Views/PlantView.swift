import UIKit

class PlantView: PropertyView {
    
    let model = PlantModel()
    override init() {
        super.init()
        
        titleLabel.text = "Plant"
        productionFactorLabel.text = "Production: \(model.productionFactor)"
        quantityLabel.text = "Quantity: \(model.quantity)"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
