import UIKit

class MainViewController: UIViewController {
    
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
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()

        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
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
        
        view.backgroundColor = #colorLiteral(red: 0.1725490196, green: 0.2431372549, blue: 0.3137254902, alpha: 1)
        
        setupViews()
        fillStackView()
    }
    
    // MARK: - Constraints
    
    /// Setup all views with its constraints
    private func setupViews() {
        addSubViews()
        setupConstraints()
    }
    
    /// A function for adding subviews.
    fileprivate func addSubViews() {
        view.addSubview(titleLabel)
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
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
            
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                                               constant: stackLeadingTrailingMargin),
            
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                                                constant: -stackLeadingTrailingMargin),
            scrollView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Layout.Padding.standard24),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            // StackView
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            

            // NextGenButton
            nextGenButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextGenButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                                                  constant: -Layout.Padding.standard64)
        ])
    }
    

    // MARK: - Functions
    
    private func fillStackView() {
        let propertyViews: [TFMPropertyCell] = [
            TFMPropertyCell(model: Money()),
            TFMPropertyCell(model: Steel()),
            TFMPropertyCell(model: Titan()),
            TFMPropertyCell(model: Plant()),
            TFMPropertyCell(model: Energy()),
            TFMPropertyCell(model: Heat()),
            TFMPropertyCell(model: Heat())
        ]
        
        propertyViews.forEach {
            stackView.addArrangedSubview($0)
        }
    }
    
}

