import UIKit

extension UICollectionView {
  static var main: UICollectionView {
    let collectionView = UICollectionView(frame: .zero,
                                          collectionViewLayout: UICollectionViewFlowLayout())
    collectionView.translatesAutoresizingMaskIntoConstraints = false

    collectionView.backgroundColor = UIColor.clear.withAlphaComponent(0)
    collectionView.alwaysBounceVertical = true
    collectionView.register(TFMPropertyCell.self, forCellWithReuseIdentifier: customCellIdentifier)
    
    return collectionView
  }
}
