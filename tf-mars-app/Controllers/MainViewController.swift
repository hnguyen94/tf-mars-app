import UIKit

let customCellIdentifier = "tfmCellId"

class MainViewController: UIViewController {
    
    // MARK: - Properties

    private let tfmBoard = TFMBoard()
    private var tfmDatasource = TfmPropertyDataSource()
    private let mainCollectionViewDelegate = MainCollectionViewDelegate()
    private var mainView: MainView!

    // MARK: - Init
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        tfmDatasource.collectionViewController = self
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Overriden functions

    override func loadView() {
        super.loadView()
        mainView = MainView(with: tfmBoard,
                            nextGenAction: nextGenerationAction,
                            resetValuesAction: resetValuesAction)

        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupCollectionView()
        loadActions()
    }

    // MARK: - Methods

    private func setupCollectionView() {
        mainView.collectionView.delegate = mainCollectionViewDelegate
        mainView.collectionView.dataSource = tfmDatasource
        tfmDatasource.tfmProperties = tfmBoard.tfmProperties
    }

}

//  MARK: - Collection View Settings

/// Actions
extension MainViewController {
    enum Unit {
        case productionFactor
        case quantity
    }

    private func makeResetAlert() {
        // Reset Alert ViewController
        mainView.resetAlert.addAction(.init(title: "OK", style: .default, handler: { (action: UIAlertAction!) in
            let resettedProperties = self.tfmBoard.resetProperties(self.tfmDatasource.tfmProperties)
            self.tfmDatasource.tfmProperties = resettedProperties
            
            self.tfmBoard.generation = 0
            
            UIView.performWithoutAnimation {
                self.mainView.collectionView.reloadData()
            }
        }))
        
        mainView.resetAlert.addAction(.init(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
            self.mainView.resetAlert .dismiss(animated: true, completion: nil)
        }))
    }
    
    private func loadActions() {
        makeResetAlert()
    }
    
    /// Reset all values (Generation counter, quantity, property).
    func resetValuesAction() {
        present(mainView.resetAlert, animated: true, completion: nil)
    }

    @objc func productionStepperValueChanged(_ sender: UIStepper) {
        changeValue(for: .productionFactor, sender: sender)
    }

    @objc func quantityStepperValueChanged(_ sender: UIStepper!) {
        changeValue(for: .quantity, sender: sender)
    }

    private func changeValue(for unit: Unit, sender: UIStepper) {
        let index = sender.tag
        let indexPath = IndexPath(item: index, section: 0)
        let item = tfmDatasource.tfmProperties[indexPath.item]

        if unit == .productionFactor {
            item.productionFactor = Int(sender.value)
        }

        if unit == .quantity {
            item.quantity = Int(sender.value)
        }

        UIView.performWithoutAnimation {
            mainView.collectionView.reloadItems(at: [indexPath])
        }
    }

    private func nextGenerationAction() {
        let nextGenerationProperties = tfmBoard.recalculateQuantity(tfmDatasource.tfmProperties)
        tfmDatasource.tfmProperties = nextGenerationProperties
        tfmBoard.generation += 1
        mainView.collectionView.reloadData()
    }

}
