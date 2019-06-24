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

  var viewModel: TFMPropertCellViewModel! {
    didSet {
      finishCellConfiguration(with: viewModel)
    }
  }

  private var incrementDecrementButtons: [UIButton] {
    let list = [
      productionIncrementButton,
      productionDecrementButton,
      quantityIncrementButton,
      quantityDecrementButton
    ]

    return list
  }

  private var unitButtons: [UnitButton] {
    let list = [productionFactorButton, quantityButton]
    return list
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
  lazy var productionIncrementButton: UIButton = {
    let button = UIButton.increment
    button.addTarget(self, action: #selector(didPressProductionIncrement), for: .touchUpInside)
    return button
  }()

  /// Default `isHidden` is set to `true` and will be set to
  /// `false` when `productionButton` is clicked.
  lazy var productionDecrementButton: UIButton = {
    let button = UIButton.decrement
    button.addTarget(self, action: #selector(didPressProductionDecrement), for: .touchUpInside)
    return button
  }()

  /// When button is touched, its increment and decrement button will
  /// shown.
  lazy var quantityButton: UnitButton = {
    let button = UnitButton.quantity
    button.addTarget(self, action: #selector(didPressQuantity), for: .touchUpInside)
    return button
  }()

  /// Default `isHidden` is set to `true` and will be set to
  /// `false` when `quantityButton` is clicked.
  lazy var quantityIncrementButton: UIButton = {
    let button = UIButton.increment
    button.addTarget(self, action: #selector(didPressQuantityIncrement), for: .touchUpInside)
    return button
  }()

  /// Default `isHidden` is set to `true` and will be set to
  /// `false` when `quantityButton` is clicked.
  lazy var quantityDecrementButton: UIButton = {
    let button = UIButton.decrement
    button.addTarget(self, action: #selector(didPressQuantityDecrement), for: .touchUpInside)
    return button
  }()

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

    configureCellLayout()
    setupViews()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - Overriden Methods

  override func prepareForReuse() {
    viewModel.hideButtons(incrementDecrementButtons)
    viewModel.defaultUnitButtonState(unitButtons)
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
  private func configureCellLayout() {
    // Border radious
    layer.cornerRadius = Layout.Cell.cornerRadius
    layer.masksToBounds = true

    // Border line
    layer.borderColor = UIColor.TFMOrange.dark.cgColor
    layer.borderWidth = Layout.Cell.borderWidth
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

  private func finishCellConfiguration(with viewModel: TFMPropertCellViewModel) {

    // Increment Decrement
    viewModel.hideButtons(incrementDecrementButtons)
    setContent(with: viewModel)
  }
  
  private func setContent(with viewModel: TFMPropertCellViewModel) {
    titleLabel.text = viewModel.title
    iconView.image = viewModel.icon
    productionFactorButton.setTitle(viewModel.productionTitle, for: .normal)
    quantityButton.setTitle(viewModel.quantityTitle, for: .normal)
  }

  @objc func didPressProduction() {
    viewModel.changeCounterButtonState(productionIncrementButton, with: productionFactorButton)
      viewModel.changeCounterButtonState(productionDecrementButton, with: productionFactorButton)
  }

  @objc func didPressQuantity() {
    viewModel.changeCounterButtonState(quantityIncrementButton, with: quantityButton)
    viewModel.changeCounterButtonState(quantityDecrementButton, with: quantityButton)
  }
  
  @objc func didPressProductionIncrement() {
    viewModel.increment(unit: .productionFactor)
    productionFactorButton.setTitle(viewModel.productionTitle, for: .normal)
  }
  
  @objc func didPressProductionDecrement() {
    viewModel.decrement(unit: .productionFactor)
    productionFactorButton.setTitle(viewModel.productionTitle, for: .normal)
  }
  
  @objc func didPressQuantityIncrement() {
    viewModel.increment(unit: .quantity)
    quantityButton.setTitle(viewModel.quantityTitle, for: .normal)
  }
  
  @objc func didPressQuantityDecrement() {
    viewModel.decrement(unit: .quantity)
    quantityButton.setTitle(viewModel.quantityTitle, for: .normal)
  }

}
