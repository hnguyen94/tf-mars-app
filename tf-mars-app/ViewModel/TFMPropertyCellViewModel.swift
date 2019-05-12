import UIKit

class TFMPropertCellViewModel {

  private var model: TFMPropertyModel

  var title: String { return model.type.rawValue }

  var icon: UIImage { return model.icon }

  var productionTitle: String {
    return "Production: \(model.productionFactor)"
  }

  var quantityTitle: String {
    return "Quantity: \(model.quantity)"
  }

  init(with model: TFMPropertyModel) {
    self.model = model
  }

}

// MARK: - Helper Methods

extension TFMPropertCellViewModel {
  /// This function change the button `isHidden` property depending on
  /// the unitButton property `isOn`.
  /// To make sure that the state is always correct, it's always checking
  /// the unitButton state. CounterButtons and UnitButtons have to be
  /// linked together.
  ///
  /// NOTE: There was a bug where the counter buttons where shown.
  ///       But the the unitButton state didn't change.
  func changeCounterButtonState(_ button: UIButton, with unitButton: UnitButton) {
    if unitButton.isOn {
      button.isHidden = false
    } else {
      button.isHidden = true
    }
  }

  func hideButtons(_ list: [UIButton]) {
    for button in list {
      button.isHidden = true
    }
  }

  func defaultUnitButtonState(_ buttonList: [UnitButton]) {
    for button in buttonList {
      button.defaultState()
    }

  }
}
