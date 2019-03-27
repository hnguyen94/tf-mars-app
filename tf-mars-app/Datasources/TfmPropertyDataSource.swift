import UIKit

class TfmPropertyDataSource: NSObject, UICollectionViewDataSource {

    var collectionViewController: MainCollectionViewController? = nil
    var tfmProperties = [TFMPropertyProtocol]()

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let totalCells = tfmProperties.count
        return totalCells
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: customCellIdentifier, for: indexPath) as! TFMPropertyCell
        cell.model = tfmProperties[indexPath.item]

        // stepper
        cell.productionStepper.addTarget(collectionViewController,
                                         action: #selector(collectionViewController?.productionStepperValueChanged),
                                         for: .valueChanged)
        cell.quantityStepper.addTarget(collectionViewController,
                                         action: #selector(collectionViewController?.quantityStepperValueChanged),
                                         for: .valueChanged)

        cell.productionStepper.tag = indexPath.item
        cell.quantityStepper.tag = indexPath.item

        return cell
    }

}
