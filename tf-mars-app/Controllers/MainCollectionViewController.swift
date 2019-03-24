import UIKit

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

    private let customCellIdentifier = "customCellIdentifier"
    weak var collectionView: UICollectionView!

    let viewModel = TFMPropertyViewModel()
    /// An Array of TFMProperties which conforms to the TFMPropertyProtocol.

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

    // MARK: - Methods

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


    // MARK: - Functions

    private func setupCollectionView() {
        collectionView.backgroundColor = UIColor.clear.withAlphaComponent(0)
        collectionView.alwaysBounceVertical = true
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(TFMPropertyCell.self, forCellWithReuseIdentifier: customCellIdentifier)

    }

    @objc private func nextGeneration() {
//        viewModel.st
        
    }
    
}

//  MARK: - Collection View Settings


/// Datasource
extension MainCollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let totalCells = viewModel.tfmProperties.count
        return totalCells
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: customCellIdentifier, for: indexPath) as! TFMPropertyCell
        cell.model = viewModel.tfmProperties[indexPath.item]

        return cell
    }
}

/// Delegate Flow Layout
extension MainCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: collectionView.frame.width, height: 110)
        return size
    }
}
