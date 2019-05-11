import UIKit

extension MainView {
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
    label.text = viewModel.displayGeneration(with: $0)
    label.font = UIFont.systemFont(ofSize: 16)
    label.textColor = .white
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }(tfmBoard.generation)
  
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
  
  /// `generationPickerView.isHidden` is default set
  /// to `true` in the init method
  lazy var generationPickerView: UIPickerView = {
    let picker = UIPickerView()
    picker.backgroundColor = .white
    picker.translatesAutoresizingMaskIntoConstraints = false
    return picker
  }()
}
