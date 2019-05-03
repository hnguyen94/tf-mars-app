import UIKit

class TFMPropertyCell: UICollectionViewCell {
  
  // MARK: - Constants
  
  struct Layout {
    struct Cell {
      static let cornerRadius: CGFloat = 10
    }
    
    struct Padding {
      static let standard: CGFloat = 8
      static let standard16: CGFloat = Layout.Padding.standard * 2
    }
  }
  
  struct FontSize {
    static let big: CGFloat = 18
    static let normal: CGFloat = 16
  }
  
  // MARK: - Properties
  
  var model: TFMPropertyModel? {
    didSet {
      setContent()
      setupActions()
    }
  }
  
  // MARK: - View Properties
  
  lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.textColor = .white
    label.font = UIFont.systemFont(ofSize: FontSize.big, weight: .bold)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  lazy var productionFactorLabel: UILabel = {
    let label = UILabel()
    label.textColor = .white
    label.font = UIFont.systemFont(ofSize: FontSize.normal)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  lazy var quantityLabel: UILabel = {
    let label = UILabel()
    label.textColor = .white
    label.font = UIFont.systemFont(ofSize: FontSize.normal)
    label.font = UIFont.systemFont(ofSize: FontSize.normal)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
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
      // TitleLabel
      titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Layout.Padding.standard16),
      titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: Layout.Padding.standard),
      
      // ProductonFactorLabel
      productionFactorLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
      productionFactorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Layout.Padding.standard),
      
      // QuantityLabel
      quantityLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
      quantityLabel.topAnchor.constraint(equalTo: productionFactorLabel.bottomAnchor, constant: Layout.Padding.standard16),
      
      // ProductionStepper
      productionStepper.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Layout.Padding.standard16),
      productionStepper.centerYAnchor.constraint(equalTo: productionFactorLabel.centerYAnchor),
      
      // Quantity Stepper
      quantityStepper.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Layout.Padding.standard16),
      quantityStepper.centerYAnchor.constraint(equalTo: quantityLabel.centerYAnchor)
      
      ])
  }
  
  // MARK: - Methods
  
  /// Styling for the view itself
  private func configureView() {
    layer.cornerRadius = Layout.Cell.cornerRadius
    layer.masksToBounds = true
  }
  
  private func setupViews() {
    addSubviews(titleLabel,
                quantityLabel,
                productionFactorLabel,
                productionStepper,
                quantityStepper)

    setupConstraints()
  }
  
  private func setContent() {
    titleLabel.text = model?.type.rawValue
    productionFactorLabel.text = "Production: \(model?.productionFactor ?? 0)"
    quantityLabel.text = "Quantity: \(model?.quantity ?? 0)"
    productionStepper.minimumValue = model?.minimumProductionNumber ?? 0
    productionStepper.maximumValue = model?.maximumProductionNumber ?? 0
  }
  
  private func setupActions() {
    guard let model = model else { return }
    
    productionStepper.value = Double(model.productionFactor)
    quantityStepper.value = Double(model.quantity)
    
    addTapGestureRecognizer {
      guard let model = self.model else { return }
      print("Tapped \(model.type)")
    }
  }
  
}
