import Foundation

struct TFMPropertyModel: TFMPropertyProtocol {
    var type: TFMProperty
    var quantity: Int
    var productionFactor: Int
    
    init(type: TFMProperty, quantity: Int = 0, productionFactor: Int = 0) {
        self.type = type
        self.quantity = quantity
        self.productionFactor = productionFactor
    }
}

