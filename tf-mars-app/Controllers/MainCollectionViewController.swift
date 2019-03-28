import UIKit

let customCellIdentifier = "tfmCellId"

class MainCollectionViewController: UIViewController {
    
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

    weak var collectionView: UICollectionView!
    private let viewModel = TFMPropertyViewModel()
    let tfmDatasource: TfmPropertyDataSource

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
        button.addTarget(self, action: #selector(nextGeneration), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - Init
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.tfmDatasource = TfmPropertyDataSource()

        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

        tfmDatasource.collectionViewController = self
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Overriden functions

    override func loadView() {
        super.loadView()


        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)

        self.collectionView = collectionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = #colorLiteral(red: 0.1725490196, green: 0.2431372549, blue: 0.3137254902, alpha: 1)

        setupCollectionView()
        setupViews()
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
            
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                                               constant: stackLeadingTrailingMargin),
            
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                                                constant: -stackLeadingTrailingMargin),
            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Layout.Padding.standard24),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

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


    // MARK: - Methods

    private func setupCollectionView() {
        collectionView.backgroundColor = UIColor.clear.withAlphaComponent(0)
        collectionView.alwaysBounceVertical = true
        collectionView.delegate = self
        collectionView.dataSource = tfmDatasource
        tfmDatasource.tfmProperties = viewModel.tfmProperties
        collectionView.register(TFMPropertyCell.self, forCellWithReuseIdentifier: customCellIdentifier)
    }
    
}

//  MARK: - Collection View Settings


/// Delegate Flow Layout
extension MainCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: collectionView.frame.width, height: 110)
        return size
    }
}

// Action
extension MainCollectionViewController {
    enum Unit {
        case productionFactor
        case quantity
    }

    @objc func productionStepperValueChanged(_ sender: UIStepper) {
        changeValue(for: .productionFactor, sender: sender)
    }

    @objc func quantityStepperValueChanged(_ sender: UIStepper!) {
        changeValue(for: .quantity, sender: sender)
    }

    private func changeValue(for unit: Unit, sender: UIStepper) {
        let index = sender.tag
        let indexPath = IndexPath(item: index, section: 0)
        let item = tfmDatasource.tfmProperties[indexPath.item]

        if unit == .productionFactor {
            item.productionFactor = Int(sender.value)
        }

        if unit == .quantity {
            item.quantity = Int(sender.value)
        }


        UIView.performWithoutAnimation {
            collectionView.reloadItems(at: [indexPath])
        }
    }

    @objc private func nextGeneration() {
        let nextGenerationProperties = viewModel.recalculateQuantity(tfmDatasource.tfmProperties)
        tfmDatasource.tfmProperties = nextGenerationProperties

        DispatchQueue.main.async { [weak self] in
            self?.collectionView.reloadData()
        }
    }
}
