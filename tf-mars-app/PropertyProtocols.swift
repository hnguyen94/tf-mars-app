import UIKit

/// TFM -> TerraFormingMars
enum TFMProperty: String {
    case megaCredit = "Mega Credits"
    case steel = "Steel"
    case titan = "Titan"
    case plant = "Plant"
    case energy = "Energy"
    case heat = "Heat"
}

protocol TFMPropertyProtocol {
    var type: TFMProperty { get set }
    var productionFactor: Int { get set }
    var minimumProductionNumber: Int { get}
    var maximumProductionNumber: Int { get }
    var quantity: Int { get set }
}


protocol TerraFormable {
    func upgradeTerraForm() -> Void
}

protocol EnergyConvertable {
    func convertEnergy() -> Void
}
