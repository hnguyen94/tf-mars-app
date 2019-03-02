import UIKit

protocol PropertyProtocol {
    var productionFactor: Int { get set }
    var quantity: Int { get set }
}

extension PropertyProtocol {
    var productionFactor: Int { return 0 }
    var quantity: Int { return 0 }
}

protocol TerraFormable {
    func upgradeTerraForm() -> Void
}

protocol EnergyConvertable {
    func convertEnergy() -> Void
}
