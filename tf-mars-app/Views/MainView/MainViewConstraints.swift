import UIKit

// MARK: - Constraints

extension MainView {

  /// Setup all views with its constraints
  func setupViews() {
    addSubviews()
    setupConstraints()
  }
  
  private func addSubviews() {
    addSubview(titleLabel)
    addSubview(generationLabel)
    addSubview(terraFormButton)
    addSubview(resetButton)
    addSubview(collectionView)
    addSubview(gradientBackgroundView)
    addSubview(nextGenButton)
    addSubview(generationPickerView)
  }
  
  /// A function for setting the constraints.
  private func setupConstraints() {
    setupTitleLabelConstraints()
    setupGenerationCounterConstraints()
    setupTerraFormValueButton()
    setupResetButtonConstraints()
    setupCollectionViewConstraints()
    setupNextGenButtonConstraints()
    setupGenrationPickerViewConstraints()
  }
  
  private func setupTitleLabelConstraints() {
    NSLayoutConstraint.activate([
      titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
      titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor)
      ])
  }
  
  private func setupGenerationCounterConstraints() {
    NSLayoutConstraint.activate([
      generationLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
      generationLabel.bottomAnchor.constraint(equalTo: titleLabel.centerYAnchor)
      ])
  }
  
  private func setupTerraFormValueButton() {
    NSLayoutConstraint.activate([
      terraFormButton.topAnchor.constraint(equalTo: titleLabel.centerYAnchor),
      terraFormButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24)
      ])
  }
  
  private func setupResetButtonConstraints() {
    NSLayoutConstraint.activate([
      resetButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
      resetButton.lastBaselineAnchor.constraint(equalTo: titleLabel.lastBaselineAnchor)
      ])
  }
  
  private func setupCollectionViewConstraints() {
    let stackLeadingTrailingMargin = Layout.Padding.standard24
    
    NSLayoutConstraint.activate([
      collectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,
                                              constant: stackLeadingTrailingMargin),
      collectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor,
                                               constant: -stackLeadingTrailingMargin),
      collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Layout.Padding.standard24),
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
}
