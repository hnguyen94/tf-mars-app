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
  
  let headerView: HeaderView

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

  // TODO: Extract
  /// `generationPickerView.isHidden` is default set
  /// to `true` in the init method
  lazy var generationPickerView: UIPickerView = {
    let picker = UIPickerView()
    picker.backgroundColor = .white
    picker.translatesAutoresizingMaskIntoConstraints = false
    return picker
  }()
  
  // MARK: - Initializer
  
  init(with tfmBoard: TFMBoard,
       nextGenAction: @escaping () -> Void,
       resetValuesAction: @escaping () -> Void) {
    self.tfmBoard = tfmBoard
    self.nextGenAction = nextGenAction
    self.resetValuesAction = resetValuesAction
    self.headerView = HeaderView(with: tfmBoard)

    super.init(frame: .zero)
    
    headerView.toggleGenerationPicker = toggleGenerationPickerView
    headerView.resetValuesAction = resetValuesAction
    generationPickerView.isHidden = true
    backgroundColor = #colorLiteral(red: 0.137254902, green: 0.003921568627, blue: 0.09803921569, alpha: 1)
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
  
  @objc func toggleGenerationPickerView() {
    generationPickerView.isHidden = !generationPickerView.isHidden
  }

}
