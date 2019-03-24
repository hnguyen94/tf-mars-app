import Foundation

struct TFMPropertyModel: TFMPropertyProtocol {
    var type: TFMProperty
    var quantity: Int
    var productionFactor: Int
    
    /// Minimum production number that will be shown in cell.
    var minimumProductionNumber: Double {
        if type == .megaCredit {
            return -10
        }
        
        return 0
    }
    
    /// Maximum production number that will be shown in cell.
    var maximumProductionNumber: Double {
        return 30
    }
    

    
    init(type: TFMProperty, quantity: Int = 0, productionFactor: Int = 0) {
        self.type = type
        self.quantity = quantity
        self.productionFactor = productionFactor
    }
}

