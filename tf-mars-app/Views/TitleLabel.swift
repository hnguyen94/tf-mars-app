import UIKit

class MainView: UIView {

    struct Layout {
        struct Padding {
            static let standard: CGFloat = 8
            static let standard24: CGFloat = Layout.Padding.standard * 3
        }
    }

    // MARK: - Properties

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Terra Forming Board"
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = .white

        label.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    weak var collectionView: UICollectionView! = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = UIColor.clear.withAlphaComponent(0)
        collectionView.alwaysBounceVertical = true
        collectionView.register(TFMPropertyCell.self, forCellWithReuseIdentifier: customCellIdentifier)

        collectionView.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        return collectionView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = #colorLiteral(red: 0.1725490196, green: 0.2431372549, blue: 0.3137254902, alpha: 1)
        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        addSubviews()
        setupConstraints()
    }

    private func addSubviews() {
        addSubview(titleLabel)
    }

    private func setupConstraints() {
        let stackLeadingTrailingMargin = Layout.Padding.standard24

        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,
                                            constant: Layout.Padding.standard24),

            collectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,
                                                    constant: stackLeadingTrailingMargin),

            collectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor,
                                                     constant: -stackLeadingTrailingMargin),
            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Layout.Padding.standard24),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
