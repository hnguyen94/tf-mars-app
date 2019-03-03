import UIKit

class MoneyCellView: PropertyCellView {
    
    let model = MoneyModel()
    
    override init() {
        super.init()
        
        titleLabel.text = "Mega Credits"
        productionFactorLabel.text = "Production: \(model.productionFactor)"
        quantityLabel.text = "Quantity: \(model.quantity)"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}