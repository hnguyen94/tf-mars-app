import UIKit

class SteelCell: PropertyCell {
    
    let model = Steel()
    
    override init() {
        super.init()
        
        titleLabel.text = model.title
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupActions() {
        productionStepper.value = Double(model.productionFactor)
        productionStepper.addTarget(self, action: #selector(productionStepperValueChanged), for: .valueChanged)
        
        quantityStepper.value = Double(model.quantity)
        quantityStepper.addTarget(self, action: #selector(quantityStepperValueChanged), for: .valueChanged)
        
        addTapGestureRecognizer {
            print("Tapped \(self.model.title)")
        }
    }
    
    @objc func productionStepperValueChanged(_ sender: UIStepper!) {
        let stepperValue = Int(sender.value)
        
        DispatchQueue.main.async {
            self.productionFactorLabel.text = "Production: \(stepperValue)"
        }
    }
    
    @objc func quantityStepperValueChanged(_ sender: UIStepper!) {
        let stepperValue = Int(sender.value)
        
        DispatchQueue.main.async {
            self.quantityLabel.text = "Quantity: \(stepperValue)"
        }
    }

    
}
