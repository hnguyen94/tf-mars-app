import UIKit

class TfmPropertyDataSource: NSObject, UICollectionViewDataSource {

    // MARK: - Properties

    var collectionViewController: MainViewController? = nil
    var tfmProperties = [TFMPropertyModel]()

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let totalCells = tfmProperties.count
        return totalCells
    }

    // MARK: - Methods

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: customCellIdentifier, for: indexPath) as! TFMPropertyCell
        cell.model = tfmProperties[indexPath.item]

        // Stepper
        cell.productionStepper.addTarget(collectionViewController,
                                         action: #selector(collectionViewController?.productionStepperValueChanged),
                                         for: .valueChanged)
        cell.quantityStepper.addTarget(collectionViewController,
                                         action: #selector(collectionViewController?.quantityStepperValueChanged),
                                         for: .valueChanged)

        // Tag
        cell.productionStepper.tag = indexPath.item
        cell.quantityStepper.tag = indexPath.item

        return cell
    }

}
