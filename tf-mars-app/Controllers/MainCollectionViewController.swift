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

    private let viewModel = TFMPropertyContainer()
    let tfmDatasource: TfmPropertyDataSource

    // MARK: - View Properties

//    var mainView = TestView()

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

//        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()


//        setupCollectionView()
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
//        view.addSubview(nextGenButton)
    }
    
    /// A function for setting the constraints.
    fileprivate func setupConstraints() {
        // Variables

        NSLayoutConstraint.activate([
            // TitleLabel


            // NextGenButton
//            nextGenButton.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
//            nextGenButton.bottomAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.bottomAnchor,
//                                                  constant: -Layout.Padding.standard)

            // Next Gen Backgroundview
//            nextGenBackgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            nextGenBackgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            nextGenBackgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//            nextGenBackgroundView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }


    // MARK: - Methods

    private func setupCollectionView() {
//        mainView.collectionView.delegate = self
//        mainView.collectionView.dataSource = tfmDatasource
        tfmDatasource.tfmProperties = viewModel.tfmProperties
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

/// Action
extension MainCollectionViewController {
    enum Unit {
        case productionFactor
        case quantity
    }

    @objc func productionStepperValueChanged(_ sender: UIStepper) {
        changeValue(for: .productionFactor, sender)
    }

    @objc func quantityStepperValueChanged(_ sender: UIStepper!) {
        changeValue(for: .quantity, sender)
    }

    private func changeValue(for unit: Unit, _ sender: UIStepper) {
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
//            mainView.collectionView.reloadItems(at: [indexPath])
        }
    }

    @objc private func nextGeneration() {
        let nextGenerationProperties = viewModel.recalculateQuantity(tfmDatasource.tfmProperties)
        tfmDatasource.tfmProperties = nextGenerationProperties

        DispatchQueue.main.async { [weak self] in
//            self?.mainView.collectionView.reloadData()
        }
    }
}
