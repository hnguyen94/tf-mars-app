import UIKit

private struct Layout {
  struct Button {
    static let borderWidth: CGFloat = 1
    static let cornerRadius: CGFloat = 8
    static let horizontalSpaceProduction: CGFloat = 12
    static let horizontalSpaceQuantity: CGFloat = 18
    static let verticalSpace: CGFloat = 3
  }

  struct FontSize {
    static let title: CGFloat = 12
    static let property: CGFloat = 10
  }
}

class UnitButton: UIButton {

  var isOn: Bool = false

  override init(frame: CGRect) {
    super.init(frame: .zero)

    translatesAutoresizingMaskIntoConstraints = false
    addTarget(self, action: #selector(didPressUnitButtonUI), for: .touchUpInside)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  @objc func didPressUnitButtonUI() {
    toggleButton(!isOn)
  }

  private func toggleButton(_ bool: Bool) {
    isOn = bool

    let color = bool ? .clear : UIColor.TFMOrange.light
    let titleColor = bool ? UIColor.TFMOrange.light : .white

    setTitleColor(titleColor, for: .normal)
    backgroundColor = color
  }

}

extension UIButton {
  static var unit: UIButton {
    let button = UnitButton()

    button.setTitleColor(UIColor.TFMOrange.light, for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: Layout.FontSize.property)
    button.backgroundColor = .clear

    button.layer.cornerRadius = Layout.Button.cornerRadius
    button.layer.borderWidth = Layout.Button.borderWidth
    button.layer.borderColor = UIColor.TFMOrange.light.cgColor

    return button
  }

  static var productionFactor: UIButton {
    let button = UIButton.unit
    button.contentEdgeInsets = UIEdgeInsets(top: Layout.Button.verticalSpace,
                                            left: Layout.Button.horizontalSpaceProduction,
                                            bottom: Layout.Button.verticalSpace,
                                            right: Layout.Button.horizontalSpaceProduction)
    return button
  }

  static var quantity: UIButton {
    let button = UIButton.unit
    button.contentEdgeInsets = UIEdgeInsets(top: Layout.Button.verticalSpace,
                                            left: Layout.Button.horizontalSpaceQuantity,
                                            bottom: Layout.Button.verticalSpace,
                                            right: Layout.Button.horizontalSpaceQuantity)
    return button
  }

}
