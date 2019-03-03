import UIKit

class HeatCell: PropertyCell {
    
    let model = Heat()
    
    override init() {
        super.init()
        
        titleLabel.text = model.title
        productionFactorLabel.text = "Production: \(model.productionFactor)"
        quantityLabel.text = "Quantity: \(model.quantity)"
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupActions() {
        addTapGestureRecognizer {
            print("Tapped \(self.model.title)")
        }
    }
    
}
