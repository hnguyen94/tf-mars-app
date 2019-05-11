import UIKit

// swiftlint:disable nesting

class TFMPropertyCell: UICollectionViewCell {
  
  // MARK: - Constants
  
  struct Layout {
    struct Cell {
      static let cornerRadius: CGFloat = 10
      static let borderWidth: CGFloat = 1
    }
    
    struct Padding {
      static let counter: CGFloat = 6
      static let standard: CGFloat = 8
      static let standard24: CGFloat = Layout.Padding.standard * 3
    }
  }

  struct FontSize {
    static let title: CGFloat = 12
    static let property: CGFloat = 10
  }
  
  // MARK: - Properties
  
  var model: TFMPropertyModel? {
    didSet {
      setupData()
    }
  }
  
  // MARK: - View Properties

  lazy var iconView: UIImageView = {
    let icon = UIImageView()
    icon.translatesAutoresizingMaskIntoConstraints = false
    return icon
  }()

  lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.textColor = .white
    label.font = UIFont.systemFont(ofSize: FontSize.title, weight: .bold)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  /// When button is touched, its increment and decrement button will
  /// shown.
  private lazy var productionFactorButton: UnitButton = {
    let button = UnitButton.productionFactor
    button.addTarget(self, action: #selector(didPressProduction), for: .touchUpInside)
    return button
  }()

  /// Default `isHidden` is set to `true` and will be set to
  /// `false` when `productionButton` is clicked.
  lazy var productionIncrementButton = UIButton.increment

  /// Default `isHidden` is set to `true` and will be set to
  /// `false` when `productionButton` is clicked.
  lazy var productionDecrementButton = UIButton.decrement

  /// When button is touched, its increment and decrement button will
  /// shown.
  lazy var quantityButton: UnitButton = {
    let button = UnitButton.quantity
    button.addTarget(self, action: #selector(didPressQuantity), for: .touchUpInside)
    return button
  }()

  /// Default `isHidden` is set to `true` and will be set to
  /// `false` when `quantityButton` is clicked.
  lazy var quantityIncrementButton = UIButton.increment

  /// Default `isHidden` is set to `true` and will be set to
  /// `false` when `quantityButton` is clicked.
  lazy var quantityDecrementButton = UIButton.decrement

  lazy var productionStepper: UIStepper = {
    let stepper = UIStepper()
    stepper.wraps = true
    stepper.autorepeat = true
    stepper.translatesAutoresizingMaskIntoConstraints = false
    return stepper
  }()
  
  lazy var quantityStepper: UIStepper = {
    let stepper = UIStepper()
    stepper.wraps = true
    //        stepper.autorepeat = true
    stepper.maximumValue = 1000
    stepper.translatesAutoresizingMaskIntoConstraints = false
    return stepper
  }()
  
  // MARK: - Init
  override init(frame: CGRect) {
    super.init(frame: frame)

    configureCell()
    setupViews()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Constraints
  
  func setupConstraints() {
    NSLayoutConstraint.activate([
      // Icon
      iconView.centerXAnchor.constraint(equalTo: centerXAnchor),
      iconView.topAnchor.constraint(equalTo: topAnchor,
                                    constant: Layout.Padding.standard24),

      // TitleLabel
      titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
      titleLabel.topAnchor.constraint(equalTo: iconView.bottomAnchor,
                                      constant: Layout.Padding.standard),

      // ProductonFactorLabel
      productionFactorButton.centerXAnchor.constraint(equalTo: centerXAnchor),
      productionFactorButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,
                                                  constant: Layout.Padding.standard),

      // Production Increment Button
      productionIncrementButton.centerYAnchor.constraint(equalTo: productionFactorButton.centerYAnchor),
      productionIncrementButton.leadingAnchor.constraint(equalTo: productionFactorButton.trailingAnchor,
                                                          constant: Layout.Padding.counter),

      // Production Decrement Button
      productionDecrementButton.centerYAnchor.constraint(equalTo: productionFactorButton.centerYAnchor),
      productionDecrementButton.trailingAnchor.constraint(equalTo: productionFactorButton.leadingAnchor,
                                                          constant: -Layout.Padding.counter),

      // QuantityLabel
      quantityButton.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor),
      quantityButton.topAnchor.constraint(equalTo: productionFactorButton.bottomAnchor,
                                          constant: CGFloat(6)),

      // Quantity Increment Button
      quantityIncrementButton.centerYAnchor.constraint(equalTo: quantityButton.centerYAnchor),
      quantityIncrementButton.leadingAnchor.constraint(equalTo: quantityButton.trailingAnchor,
                                                          constant: Layout.Padding.counter),
      // Quantity Decrement Button
      quantityDecrementButton.centerYAnchor.constraint(equalTo: quantityButton.centerYAnchor),
      quantityDecrementButton.trailingAnchor.constraint(equalTo: quantityButton.leadingAnchor,
                                                         constant: -Layout.Padding.counter)
      ])
  }
  
  // MARK: - Methods
  
  /// Styling for the view itself
  private func configureCell() {
    // Border radious
    layer.cornerRadius = Layout.Cell.cornerRadius
    layer.masksToBounds = true

    // Border line
    layer.borderColor = UIColor.TFMOrange.dark.cgColor
    layer.borderWidth = Layout.Cell.borderWidth

    // Increment Decrement
    let incrementDecrementList = [
      productionIncrementButton,
      productionDecrementButton,
      quantityIncrementButton,
      quantityDecrementButton
    ]

    for button in incrementDecrementList {
      button.isHidden = true
    }

  }
  
  private func setupViews() {
    addSubviews(titleLabel,
                iconView,
                quantityButton,
                quantityIncrementButton,
                quantityDecrementButton,
                productionFactorButton,
                productionIncrementButton,
                productionDecrementButton)

    setupConstraints()
  }

  private func setupData() {
    guard let model = model else {
      assertionFailure("Model is not set")
      return
    }
    
    setContent(with: model)
    setupActions(with: model)
  }
  
  private func setContent(with model: TFMPropertyModel) {
    titleLabel.text = model.type.rawValue
    iconView.image = model.icon
    productionFactorButton.setTitle("Production: \(model.productionFactor)", for: .normal)
    quantityButton.setTitle("Quantity: \(model.quantity)", for: .normal)
    productionStepper.minimumValue = model.minimumProductionNumber
    productionStepper.maximumValue = model.maximumProductionNumber
  }
  
  private func setupActions(with model: TFMPropertyModel) {
    productionStepper.value = Double(model.productionFactor)
    quantityStepper.value = Double(model.quantity)
  }

  @objc func didPressProduction() {
    productionIncrementButton.toggleHiddenState()
    productionDecrementButton.toggleHiddenState()
  }

  @objc func didPressQuantity() {
    quantityIncrementButton.toggleHiddenState()
    quantityDecrementButton.toggleHiddenState()
  }

}
