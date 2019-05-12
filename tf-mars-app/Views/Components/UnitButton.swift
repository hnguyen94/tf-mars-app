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

    setTitleColor(UIColor.TFMOrange.light, for: .normal)
    titleLabel?.font = UIFont.systemFont(ofSize: Layout.FontSize.property)
    backgroundColor = .clear

    layer.cornerRadius = Layout.Button.cornerRadius
    layer.borderWidth = Layout.Button.borderWidth
    layer.borderColor = UIColor.TFMOrange.dark.cgColor

    translatesAutoresizingMaskIntoConstraints = false
    addTarget(self, action: #selector(didPressUnitButtonUI), for: .touchUpInside)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func defaultState() {
    setTitleColor(UIColor.TFMOrange.light, for: .normal)
    titleLabel?.font = UIFont.systemFont(ofSize: Layout.FontSize.property)
    backgroundColor = .clear
  }

  @objc func didPressUnitButtonUI() {
    toggleButton(!isOn)
  }

  private func toggleButton(_ bool: Bool) {
    isOn = bool

    let color = bool ? UIColor.TFMOrange.light : .clear
    let titleColor = bool ? .white : UIColor.TFMOrange.light

    setTitleColor(titleColor, for: .normal)
    backgroundColor = color
  }

}

extension UnitButton {
  static var productionFactor: UnitButton {
    let button = UnitButton()
    button.contentEdgeInsets = UIEdgeInsets(top: Layout.Button.verticalSpace,
                                            left: Layout.Button.horizontalSpaceProduction,
                                            bottom: Layout.Button.verticalSpace,
                                            right: Layout.Button.horizontalSpaceProduction)
    return button
  }

  static var quantity: UnitButton {
    let button = UnitButton()
    button.contentEdgeInsets = UIEdgeInsets(top: Layout.Button.verticalSpace,
                                            left: Layout.Button.horizontalSpaceQuantity,
                                            bottom: Layout.Button.verticalSpace,
                                            right: Layout.Button.horizontalSpaceQuantity)
    return button
  }

}
