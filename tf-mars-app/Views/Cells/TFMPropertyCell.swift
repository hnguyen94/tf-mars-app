import UIKit

class TFMPropertyCell: UICollectionViewCell {
  
  // MARK: - Constants
  
  struct Layout {
    struct Cell {
      static let cornerRadius: CGFloat = 10
      static let borderWidth: CGFloat = 1
    }
    
    struct Padding {
      static let standard: CGFloat = 8
      static let standard16: CGFloat = Layout.Padding.standard * 2
      static let standard24: CGFloat = Layout.Padding.standard * 3
    }

    struct Button {
      static let borderWidth: CGFloat = 1
      static let cornerRadius: CGFloat = 8
      static let horizontalSpaceProduction: CGFloat = 12
      static let horizontalSpaceQuantity: CGFloat = 18
      static let verticalSpace: CGFloat = 3
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
  
  lazy var productionFactorButton: UIButton = {
    let button = UIButton()
    button.setTitleColor(UIColor.TFMOrange.light, for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: FontSize.property)
    button.backgroundColor = .clear
    button.layer.cornerRadius = Layout.Button.cornerRadius
    button.layer.borderWidth = Layout.Button.borderWidth
    button.layer.borderColor = UIColor.TFMOrange.light.cgColor
    button.contentEdgeInsets = UIEdgeInsets(top: Layout.Button.verticalSpace,
                                            left: Layout.Button.horizontalSpaceProduction,
                                            bottom: Layout.Button.verticalSpace,
                                            right: Layout.Button.horizontalSpaceProduction)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()

  lazy var quantityButton: UIButton = {
    let button = UIButton()
    button.setTitleColor(UIColor.TFMOrange.light, for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: FontSize.property)
    button.backgroundColor = .clear
    button.layer.cornerRadius = Layout.Button.cornerRadius
    button.layer.borderWidth = Layout.Button.borderWidth
    button.layer.borderColor = UIColor.TFMOrange.light.cgColor
    button.contentEdgeInsets = UIEdgeInsets(top: Layout.Button.verticalSpace,
                                            left: Layout.Button.horizontalSpaceQuantity,
                                            bottom: Layout.Button.verticalSpace,
                                            right: Layout.Button.horizontalSpaceQuantity)
    button.translatesAutoresizingMaskIntoConstraints = false
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

    configureView()
    setupViews()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Constraints
  
  fileprivate func setupConstraints() {
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

      // QuantityLabel
      quantityButton.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor),
      quantityButton.topAnchor.constraint(equalTo: productionFactorButton.bottomAnchor,
                                          constant: CGFloat(6)),

      // ProductionStepper
//      productionStepper.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Layout.Padding.standard16),
//      productionStepper.centerYAnchor.constraint(equalTo: productionFactorLabel.centerYAnchor),

      // Quantity Stepper
//      quantityStepper.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Layout.Padding.standard16),
//      quantityStepper.centerYAnchor.constraint(equalTo: quantityLabel.centerYAnchor)

      ])
  }
  
  // MARK: - Methods
  
  /// Styling for the view itself
  private func configureView() {
    // Border radious
    layer.cornerRadius = Layout.Cell.cornerRadius
    layer.masksToBounds = true

    // Border line
    layer.borderColor = UIColor.TFMOrange.light.cgColor
    layer.borderWidth = Layout.Cell.borderWidth

  }
  
  private func setupViews() {
    addSubviews(titleLabel,
                iconView,
                quantityButton,
                productionFactorButton)

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
    
    addTapGestureRecognizer {
      guard let model = self.model else { return }
      print("Tapped \(model.type)")
    }
  }
  
}
