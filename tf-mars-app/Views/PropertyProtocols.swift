import UIKit

protocol PropetyCellProtocol { }

/// Protcol can be only used for UIViews
extension PropetyCellProtocol where Self: UIView {
    var backgroundColor: UIColor { get }
}

protocol PropertyProtocol {
    var productionFactor: Int { get }
    var content: Int { get }
}

protocol TerraFormable {
    func upgradeTerraForm() -> Void
}

protocol EnergyConvertable {
    func convertEnergy() -> Void
}
