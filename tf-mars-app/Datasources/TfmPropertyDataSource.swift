import UIKit

class TfmPropertyDataSource: NSObject, UICollectionViewDataSource {

    var tfmProperties = [TFMPropertyProtocol]()

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let totalCells = tfmProperties.count
        return totalCells
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: customCellIdentifier, for: indexPath) as! TFMPropertyCell
        cell.model = tfmProperties[indexPath.item]

        return cell
    }

}
