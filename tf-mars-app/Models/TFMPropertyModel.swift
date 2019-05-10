import UIKit

struct TFMPropertyModelHelper {
  static func makeIcon(from type: TFMProperty) -> UIImage {
    switch type {
    case .megaCredit:
      return #imageLiteral(resourceName: "mega_credit")
    case .steel:
      return #imageLiteral(resourceName: "steel")
    case .titan:
      return #imageLiteral(resourceName: "titan")
    case .plant:
      return #imageLiteral(resourceName: "plant")
    case .energy:
      return #imageLiteral(resourceName: "energy")
    case .heat:
      return #imageLiteral(resourceName: "heat")
    }
  }
}

class TFMPropertyModel: TFMPropertyProtocol {

  // MARK: - Type aliases

  typealias Icon = UIImage
  typealias Quantity = Int
  typealias ProductionFactor = Int

  // MARK: - Properties
  
  var type: TFMProperty
  var quantity: Quantity
  var productionFactor: ProductionFactor
  var icon: Icon

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

  // MARK: - Init
  
  init(type: TFMProperty, quantity: Int = 0, productionFactor: Int = 0) {
    self.type = type
    self.quantity = quantity
    self.productionFactor = productionFactor
    self.icon = TFMPropertyModelHelper.makeIcon(from: type)

  }

}

