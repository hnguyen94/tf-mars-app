import UIKit

class ViewController: UIViewController {
    
    struct Layout {
        struct Padding {
            static let nextGenButtonBottom: CGFloat = 64
            static let titleLabelTop: CGFloat = 24
        }
    }
    
    // MARK: - Properties
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Terra Forming Board"
        label.font = UIFont.systemFont(ofSize: 24)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupViews()
    }
    
    private func setupViews() {
        view.addSubview(titleLabel)
        view.addSubview(<#T##view: UIView##UIView#>)
        view.addSubview(nextGenButton)

        layoutNextGenButton()
        layoutTitleLabel()
    }
    
    private func layoutTitleLabel() {
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                            constant: Layout.Padding.titleLabelTop)
        ])
    }
    
    private func layoutNextGenButton() {
        NSLayoutConstraint.activate([
            nextGenButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextGenButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                                                  constant: -Layout.Padding.nextGenButtonBottom)
        ])
    }
    
}

