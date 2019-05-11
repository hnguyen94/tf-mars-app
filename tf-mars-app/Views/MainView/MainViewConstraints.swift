import UIKit

// MARK: - Constraints

extension MainView {

  /// Setup all views with its constraints
  func setupViews() {
    addSubviews(headerView,
                collectionView,
                nextGenButton,
                generationPickerView)

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
}
