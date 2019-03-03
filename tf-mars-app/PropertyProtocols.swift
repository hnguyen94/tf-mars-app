import UIKit

protocol PropertyProtocol {
    var title: String { get set }
    var productionFactor: Int { get set }
    var quantity: Int { get set }
}

protocol ProductFactorRangeProtocol {
    var range: [Int] { get set }
}

protocol TerraFormable {
    func upgradeTerraForm() -> Void
}

protocol EnergyConvertable {
    func convertEnergy() -> Void
}
