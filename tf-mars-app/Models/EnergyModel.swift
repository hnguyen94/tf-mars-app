import Foundation

struct EnergyModel: PropertyProtocol, EnergyConvertable, ProductFactorRangeProtocol {
    var range: [Int] = Array(0...30)

    
    var quantity: Int = 0
    var productionFactor: Int = 0

    func convertEnergy() { }
}
