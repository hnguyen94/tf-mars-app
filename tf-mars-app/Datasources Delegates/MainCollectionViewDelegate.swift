import UIKit

class MainCollectionViewDelegate: NSObject, UICollectionViewDelegateFlowLayout {

  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      sizeForItemAt indexPath: IndexPath) -> CGSize {
    let padding: CGFloat = 24
    let height: CGFloat = 196
    let cellSize = collectionView.frame.size.width - padding
    let size = CGSize(width: cellSize/2, height: height)
    return size
  }

  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      referenceSizeForFooterInSection section: Int) -> CGSize {
    let size = CGSize(width: collectionView.frame.width, height: 110)
    return size
  }

}
