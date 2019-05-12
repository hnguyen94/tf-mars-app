import UIKit

class TfmPropertyDataSource: NSObject, UICollectionViewDataSource {

  // MARK: - Properties

  var collectionViewController: MainViewController?
  var tfmProperties = [TFMPropertyModel]()

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    let totalCells = tfmProperties.count
    return totalCells
  }

  // MARK: - Methods

  func collectionView(_ collectionView: UICollectionView,
                      cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: customCellIdentifier,
                                                    for: indexPath) as? TFMPropertyCell
      else { return UICollectionViewCell() }

    let model = tfmProperties[indexPath.item]
    cell.viewModel = TFMPropertCellViewModel(with: model)

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
