import UIKit

class PropertyCell: UIView {
    
    // MARK: - Constants
    
    struct Layout {
        static let height: CGFloat = 100
        static let cornerRadius: CGFloat = 10
    }
    
    struct FontSize {
        static let big: CGFloat = 20
        static let normal: CGFloat = 18
    }
    
    // MARK: - Properties
    

    override var intrinsicContentSize: CGSize {
        return CGSize(width: 0, height: Layout.height)
    }
    
    // MARK: - View Properties
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Placeholder Title"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: FontSize.big, weight: .bold)

        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var productionFactorLabel: UILabel = {
        let label = UILabel()
        label.text = "Production: 10"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: FontSize.normal)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var quantityLabel: UILabel = {
        let label = UILabel()
        label.text = "Quantity: 10"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: FontSize.normal)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Init
    
    init() {
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
        
        layer.cornerRadius = Layout.cornerRadius
        layer.masksToBounds = true
    }
   
    private func setupViews() {
        addSubview(titleLabel)
        addSubview(quantityLabel)
        addSubview(productionFactorLabel)
        
        NSLayoutConstraint.activate([
            // TitleLabel
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            
            // ProductonFactorLabel
            productionFactorLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            productionFactorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            
            // QuantityLabel
            quantityLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            quantityLabel.topAnchor.constraint(equalTo: productionFactorLabel.bottomAnchor, constant: 8)
        ])
    }
    
    private func setupActions() {
        addTapGestureRecognizer {
            print("Tapped!  ")
        }
    }
    
}
