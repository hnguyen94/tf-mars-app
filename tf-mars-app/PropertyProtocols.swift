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
  var type: TFMProperty { get }
  var productionFactor: Int { get set }
  var quantity: Int { get set }
  var minimumProductionNumber: Double { get}
  var maximumProductionNumber: Double { get }
}
