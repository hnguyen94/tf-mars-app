import UIKit

class ViewController: UIViewController {
    
    // MARK: - Constants
    
    struct Layout {
        struct Padding {
            static let standard: CGFloat = 8
            static let standard16: CGFloat = Layout.Padding.standard * 2
            static let standard24: CGFloat = Layout.Padding.standard * 3
            static let standard32: CGFloat = Layout.Padding.standard * 4
            static let standard40: CGFloat = Layout.Padding.standard * 5
            static let standard48: CGFloat = Layout.Padding.standard * 6
            static let standard56: CGFloat = Layout.Padding.standard * 7
            static let standard64: CGFloat = Layout.Padding.standard * 8
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
    
    /// A function for adding subviews.
    fileprivate func addSubViews() {
        view.addSubview(titleLabel)
        view.addSubview(stackView)
        view.addSubview(nextGenButton)
    }
    
    /// A function for setting the constraints.
    fileprivate func setupConstraints() {
        // Variables
        let stackLeadingTrailingMargin = Layout.Padding.standard24
        
        NSLayoutConstraint.activate([
            // TitleLabel
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                            constant: Layout.Padding.standard24),
            
            // StackView
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                                               constant: stackLeadingTrailingMargin),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                                                constant: -stackLeadingTrailingMargin),
            stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Layout.Padding.standard24),
            
            // NextGenButton
            nextGenButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextGenButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                                                  constant: -Layout.Padding.standard64)
            ])
    }
    
    /// Setup all views with its constraints
    private func setupViews() {
        addSubViews()
        setupConstraints()
    }

    // MARK: - Functions
    private func fillStackView() {
        let propertyViews: [PropertyCell] = [
            PropertyCell(model: Money()),
            PropertyCell(model: Steel()),
            PropertyCell(model: Titan()),
            PropertyCell(model: Plant()),
            PropertyCell(model: Energy()),
            PropertyCell(model: Heat()),
        ]
        
        propertyViews.forEach {
            stackView.addArrangedSubview($0)
        }
    }
    
}

