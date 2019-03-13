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
    
    // MARK: - Properties
    
    /// An Array of TFMProperties which conforms to the TFMPropertyProtocol.
    var tfmProperties: [TFMPropertyProtocol] = [] {
        didSet {
            let tfmPropertyCells = makeTFMPropertyCells(tfmProperties)
            fillStackView(with: tfmPropertyCells)
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
    
    lazy var nextGenBackgroundView: UIView = {
        let aView = UIView()
        aView.backgroundColor = #colorLiteral(red: 0.1725490196, green: 0.2431372549, blue: 0.3137254902, alpha: 1)
        
        aView.translatesAutoresizingMaskIntoConstraints = false
        return aView
    }()

    lazy var nextGenButton: UIButton = {
        let button = UIButton()
        button.setTitle("Next Generation", for: .normal)
        button.setTitleColor(.black, for: .normal)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: INIT

    // MARK: - Overriden functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.1725490196, green: 0.2431372549, blue: 0.3137254902, alpha: 1)
        
        startGame()
        setupViews()
    }
    
    // MARK: - Functions
    private func startGame() {
        let viewModel = TFMPropertyViewModel()
        tfmProperties = viewModel.tfmProperties
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
//        view.addSubview(nextGenBackgroundView)
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
                                                  constant: -Layout.Padding.standard)
            
            // Next Gen Backgroundview
//            nextGenBackgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            nextGenBackgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            nextGenBackgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//            nextGenBackgroundView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    

    // MARK: - Functions
    
    private func makeTFMPropertyCells(_ tfmProperties: [TFMPropertyProtocol]) -> [TFMPropertyCell] {
        let tfmCells = tfmProperties.map { return TFMPropertyCell(model: $0) }
        return tfmCells
    }
    
    private func fillStackView(with tfmCells: [TFMPropertyCell]) {
        tfmCells.forEach {
            stackView.addArrangedSubview($0)
        }
    }
    
}

