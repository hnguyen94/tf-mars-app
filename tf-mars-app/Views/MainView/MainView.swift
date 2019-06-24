import UIKit

// swiftlint:disable nesting

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

  var resetValuesAction: (() -> Void)? {
    didSet {
      headerView.resetValuesAction = resetValuesAction
    }
  }
  // MARK: - View objects
  
  let headerView: HeaderView
  lazy var collectionView = UICollectionView.main

  lazy var nextGenButton: UIButton = {
    let button = UIButton.nextGeneration
    button.addTarget(self, action: #selector(nextGeneration), for: .touchUpInside)
    return button
  }()

  // TODO: Extract
  /// `generationPickerView.isHidden` is default set
  /// to `true` in the init method
  lazy var generationPickerView = UIPickerView.terraFormValue
  
  lazy var toolbar: UIToolbar = {
    let toolbar = UIToolbar.terraFormValue
    let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
    let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(didPressDone))
    doneButton.tintColor = .white
    toolbar.setItems([spaceButton, doneButton], animated: false)
    return toolbar
  }()
  
  // MARK: - Initializer
  
  init(with tfmBoard: TFMBoard) {
    self.tfmBoard = tfmBoard
    self.headerView = HeaderView(with: tfmBoard)

    super.init(frame: .zero)
    
    headerView.toggleGenerationPicker = toggleGenerationPickerView
    generationPickerView.isHidden = true
    backgroundColor = #colorLiteral(red: 0.137254902, green: 0.003921568627, blue: 0.09803921569, alpha: 1)
    setupViews()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Constraints
  
  /// Setup all views with its constraints
  func setupViews() {
    addSubviews(headerView,
                collectionView,
                nextGenButton,
                generationPickerView,
                toolbar)

    setupConstraints()
  }

  /// A function for setting the constraints.
  private func setupConstraints() {
    NSLayoutConstraint.activate([
      headerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
      headerView.leadingAnchor.constraint(equalTo: leadingAnchor),
      headerView.trailingAnchor.constraint(equalTo: trailingAnchor)
    ])

    setupCollectionViewConstraints()
    setupNextGenButtonConstraints()
    setupGenrationPickerViewConstraints()
    setupToolbarConstraints()
  }

  private func setupCollectionViewConstraints() {
    let stackLeadingTrailingMargin = Layout.Padding.standard24

    NSLayoutConstraint.activate([
      collectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,
                                              constant: stackLeadingTrailingMargin),
      collectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor,
                                               constant: -stackLeadingTrailingMargin),
      collectionView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: Layout.Padding.standard),
      collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
      ])
  }

  private func setupNextGenButtonConstraints() {
    NSLayoutConstraint.activate([
      nextGenButton.centerXAnchor.constraint(equalTo: centerXAnchor),
      nextGenButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor,
                                            constant: -Layout.Padding.standard)
      ])
  }

  private func setupGenrationPickerViewConstraints() {
    NSLayoutConstraint.activate([
      generationPickerView.centerXAnchor.constraint(equalTo: centerXAnchor),
      generationPickerView.bottomAnchor.constraint(equalTo: bottomAnchor),
      generationPickerView.widthAnchor.constraint(equalTo: widthAnchor),
      generationPickerView.heightAnchor.constraint(equalToConstant: 300)
    ])
  }
  
  private func setupToolbarConstraints() {
    NSLayoutConstraint.activate([
      toolbar.bottomAnchor.constraint(equalTo: generationPickerView.topAnchor),
      toolbar.leadingAnchor.constraint(equalTo: generationPickerView.leadingAnchor),
      toolbar.trailingAnchor.constraint(equalTo: generationPickerView.trailingAnchor)
    ])
  }

  // MARK: - Methods
  
  @objc func nextGeneration() {
    nextGenAction?()
  }
  
  @objc func toggleGenerationPickerView() {
    generationPickerView.isHidden = !generationPickerView.isHidden
    toolbar.isHidden = !toolbar.isHidden
  }
  
  @objc func didPressDone() {
    generationPickerView.isHidden = !generationPickerView.isHidden
    toolbar.isHidden = !toolbar.isHidden
  }

}
