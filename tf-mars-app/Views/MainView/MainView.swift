import UIKit

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
  let viewModel = MainViewModel()
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
    label.text = viewModel.displayGeneration(with: $0)
    label.font = UIFont.systemFont(ofSize: 16)
    label.textColor = .white
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }(tfmBoard.generation)
  
  lazy var terraFormButton: UIButton = {
    let button = UIButton()
    button.setTitle($0, for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.addTarget(self, action: #selector(toggleGenerationPickerView), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }(viewModel.displayTerraForm(with: 0))
  
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
  
  // MARK: - Initializer
  
  init(with tfmBoard: TFMBoard, nextGenAction: @escaping () -> Void,
       resetValuesAction: @escaping () -> Void) {
    self.tfmBoard = tfmBoard
    self.nextGenAction = nextGenAction
    self.resetValuesAction = resetValuesAction
    super.init(frame: .zero)
    
    // Clojures
    tfmBoard.didChangeGeneration = didChangeGeneration
    tfmBoard.didChangeTerraForm = didChangeTerraForm
    
    generationPickerView.isHidden = true
    backgroundColor = #colorLiteral(red: 0.1725490196, green: 0.2431372549, blue: 0.3137254902, alpha: 1)
    setupViews()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Constraints
  // Constraints are defined in `MainViewConstraints.swift`

  // MARK: - Methods
  
  @objc func nextGeneration() {
    nextGenAction?()
  }
  
  @objc func resetValues() {
    resetValuesAction?()
  }
  
  @objc func toggleGenerationPickerView() {
    generationPickerView.isHidden = !generationPickerView.isHidden
  }
  
  func didChangeGeneration() {
    generationLabel.text = viewModel.displayGeneration(with: tfmBoard.generation)
  }
  
  func didChangeTerraForm() {
    let terraForm = viewModel.displayTerraForm(with: tfmBoard.terraForm)
    terraFormButton.setTitle(terraForm, for: .normal)
  }
  
}

