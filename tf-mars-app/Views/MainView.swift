import UIKit

let footerID = "footerID"

class MainView: UIView {
    
    // MARK: - Constants

    struct Layout {
        struct Padding {
            static let standard: CGFloat = 8
            static let standard24: CGFloat = Layout.Padding.standard * 3
            static let standard64: CGFloat = Layout.Padding.standard * 8
        }
    }
    
    // MARK: - Properties
    
    let tfmBoard: TFMBoard
    var nextGenAction: (() -> Void)?
    var resetValuesAction: (() -> Void)?

    // MARK: - View objects

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Terra Forming Board"
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var generationLabel: UILabel = {
        let label = UILabel()
        label.text = "Lv: 0"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var terraFormValueButton: UIButton = {
        let button = UIButton()
        button.setTitle("TF: 0", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    lazy var resetButton: UIButton = {
        let button = UIButton()
        button.setTitle("Reset", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(resetValues), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    lazy var resetAlert: UIAlertController = {
        let alert = UIAlertController(title: "Reset",
                                      message: NSLocalizedString("All data in units will be resetted.", comment: "Alert"),
                                      preferredStyle: .alert)
        return alert
    }()
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = UIColor.clear.withAlphaComponent(0)
        collectionView.alwaysBounceVertical = true
        collectionView.register(TFMPropertyCell.self, forCellWithReuseIdentifier: customCellIdentifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    lazy var nextGenButton: UIButton = {
        let button = UIButton()
        button.setTitle("Next Generation", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .red
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        button.contentEdgeInsets  = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        button.addTarget(self, action: #selector(nextGeneration), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    lazy var gradientBackgroundView: UIView = {
        let aView = UIView()
        aView.backgroundColor = #colorLiteral(red: 0.1725490196, green: 0.2431372549, blue: 0.3137254902, alpha: 0.601975132)
        aView.translatesAutoresizingMaskIntoConstraints = false
        return aView
    }()

    // MARK: - Initializer

    init(with tfmBoard: TFMBoard, nextGenAction: @escaping () -> Void,
         resetValuesAction: @escaping () -> Void) {
        self.tfmBoard = tfmBoard
        self.nextGenAction = nextGenAction
        self.resetValuesAction = resetValuesAction
        super.init(frame: .zero)
        
        // Clojures
        tfmBoard.didChangeGeneration = didChangeGeneration
        
        backgroundColor = #colorLiteral(red: 0.1725490196, green: 0.2431372549, blue: 0.3137254902, alpha: 1)
        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Constraints

    /// Setup all views with its constraints
    private func setupViews() {
        addSubviews()
        setupConstraints()
    }

    private func addSubviews() {
        addSubview(titleLabel)
        addSubview(generationLabel)
        addSubview(terraFormValueButton)
        addSubview(resetButton)
        addSubview(collectionView)
        addSubview(gradientBackgroundView)
        addSubview(nextGenButton)
    }

    /// A function for setting the constraints.
    private func setupConstraints() {
        let stackLeadingTrailingMargin = Layout.Padding.standard24

        NSLayoutConstraint.activate([
            // Title Label
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),

            // Generation counter label
            generationLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            generationLabel.bottomAnchor.constraint(equalTo: titleLabel.centerYAnchor),

            // Terra Form Value Label
            terraFormValueButton.topAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            terraFormValueButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),

            // Reset Button
            resetButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            resetButton.lastBaselineAnchor.constraint(equalTo: titleLabel.lastBaselineAnchor),

            // Collection View
            collectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,
                                                    constant: stackLeadingTrailingMargin),
            collectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor,
                                                     constant: -stackLeadingTrailingMargin),
            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Layout.Padding.standard24),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),

            // Next Gen Button
            nextGenButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            nextGenButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -Layout.Padding.standard)
        ])
    }
    
    // MARK: - Methods
    
    @objc func nextGeneration() {
        nextGenAction?()
    }
    
    @objc func resetValues() {
        resetValuesAction?()
    }
    
    func didChangeGeneration() {
        generationLabel.text = "Lvl: \(tfmBoard.generation)"
    }

}

