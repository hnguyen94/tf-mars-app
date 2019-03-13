import UIKit

class TFMPropertyCell: UIView {
    
    // MARK: - Constants
    
    struct Layout {
        struct Cell {
            static let height: CGFloat = 110
            static let cornerRadius: CGFloat = 10
        }
        
        struct Padding {
            static let standard: CGFloat = 8
            static let standard16: CGFloat = Layout.Padding.standard * 2
        }
    }
    
    struct FontSize {
        static let big: CGFloat = 20
        static let normal: CGFloat = 18
    }
    
    // MARK: - Properties
    
    var model: TFMPropertyProtocol

    private var minimumProductionValue: Double {
        return Double(model.minimumProductionNumber)
    }
    
    private var maximumProductionValue: Double {
        return Double(model.maximumProductionNumber)
    }
    

    // MARK: - Overriden Properties
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 0, height: Layout.Cell.height)
    }
    
    // MARK: - View Properties
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = model.type.rawValue
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: FontSize.big, weight: .bold)

        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var productionFactorLabel: UILabel = {
        let label = UILabel()
        label.text = "Production: \($0)"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: FontSize.normal)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }(model.productionFactor)
    
    lazy var quantityLabel: UILabel = {
        let label = UILabel()
        label.text = "Quantity: \($0)"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: FontSize.normal)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }(model.quantity)
    
    lazy var productionStepper: UIStepper = {
        let stepper = UIStepper()
        stepper.wraps = true
        stepper.autorepeat = true
        stepper.minimumValue = $0
        stepper.maximumValue = $1

       stepper.translatesAutoresizingMaskIntoConstraints = false
       return stepper
    }(minimumProductionValue, maximumProductionValue)
    
    lazy var quantityStepper: UIStepper = {
        let stepper = UIStepper()
        stepper.wraps = true
        stepper.autorepeat = true
        stepper.maximumValue = 100
        
        stepper.translatesAutoresizingMaskIntoConstraints = false
        return stepper
    }()

    // MARK: - Init
    
    init(model: TFMPropertyProtocol) {
        self.model = model
        
        super.init(frame: .zero)
        
        configureView()
        setupViews()
        setupActions()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    
    /// Styling for the view itself
    private func configureView() {
        backgroundColor = .white
        
        layer.cornerRadius = Layout.Cell.cornerRadius
        layer.masksToBounds = true
    }
    
    // MARK: - Constraints
   
    fileprivate func addSubViews() {
        addSubview(titleLabel)
        addSubview(quantityLabel)
        addSubview(productionFactorLabel)
        addSubview(productionStepper)
        addSubview(quantityStepper)
    }
    
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
    
    private func setupViews() {
        addSubViews()
        setupConstraints()
    }
    
    /// The default implementation does nothing.
    /// Will be called in the initializer.
    func setupActions() {
        productionStepper.value = Double(model.productionFactor)
        productionStepper.addTarget(self, action: #selector(productionStepperValueChanged), for: .valueChanged)
        
        quantityStepper.value = Double(model.quantity)
        quantityStepper.addTarget(self, action: #selector(quantityStepperValueChanged), for: .valueChanged)
        
        addTapGestureRecognizer {
            print("Tapped \(self.model.type)")
            self.backgroundColor = .red
        }
    }
    
    @objc func productionStepperValueChanged(_ sender: UIStepper!) {
        model.productionFactor = Int(sender.value)

        DispatchQueue.main.async {
            self.productionFactorLabel.text = "Production: \(self.model.productionFactor)"
        }
    }
    
    @objc func quantityStepperValueChanged(_ sender: UIStepper!) {
        model.productionFactor = Int(sender.value)
        
        DispatchQueue.main.async {
            self.quantityLabel.text = "Quantity: \(self.model.productionFactor)"
        }
    }
    
}
