import Foundation

struct Plant: PropertyProtocol, TerraFormable, ProductFactorRangeProtocol {
    var title = "Plant"
    
    var range: [Int] = Array(0...30)
    
    var quantity: Int = 0
    var productionFactor: Int = 0

    func upgradeTerraForm() {
        
    }
    
}
