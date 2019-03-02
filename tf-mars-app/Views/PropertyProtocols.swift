import UIKit

protocol PropertyProtocol {
    var productionFactor: Int { get set }
    var quantity: Int { get set }
}

protocol TerraFormable {
    func upgradeTerraForm() -> Void
}

protocol EnergyConvertable {
    func convertEnergy() -> Void
}
