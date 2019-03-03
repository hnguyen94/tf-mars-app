import UIKit

class ViewController: UIViewController {
    
    // MARK: - Constants
    
    struct Layout {
        struct Padding {
            static let nextGenButtonBottom: CGFloat = 64
            static let standard: CGFloat = 8
            static let margin: CGFloat = Layout.Padding.standard * 2 // 16
            static let titleLabelSpace: CGFloat = Layout.Padding.standard * 3 // 24
        }
    }
    
    // MARK: - View Properties
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Terra Forming Board"
        label.font = UIFont.systemFont(ofSize: 24)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = Layout.Padding.standard
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    lazy var nextGenButton: UIButton = {
        let button = UIButton()
        button.setTitle("Next Generation", for: .normal)
        button.setTitleColor(.black, for: .normal)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Overriden functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        
        setupViews()
        fillStackView()
    }
    
    // MARK: - Constraints
    
    /// Setup all views with its constraints
    private func setupViews() {
        view.addSubview(titleLabel)
        view.addSubview(stackView)
        view.addSubview(nextGenButton)

        NSLayoutConstraint.activate([
            // Title Label
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                            constant: Layout.Padding.titleLabelSpace),
            
            // StackView
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                                               constant: Layout.Padding.margin),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                                                constant: -Layout.Padding.margin),
            stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: CGFloat(24)),
            
            // NextGenButton
            nextGenButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextGenButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                                                  constant: -Layout.Padding.nextGenButtonBottom)
        ])
    }

    // MARK: - Functions
    private func fillStackView() {
        let propertyViews: [PropertyView] = [
            MoneyView(),
            SteelView(),
            TitanView(),
            PlantView(),
            EnergyView(),
            HeatView()
        ]
        
        propertyViews.forEach {
            stackView.addArrangedSubview($0)
        }
       
        
    }
}

