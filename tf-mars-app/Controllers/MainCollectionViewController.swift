import UIKit

let customCellIdentifier = "tfmCellId"

class MainCollectionViewController: UIViewController {
    
    // MARK: - Properties

    private let viewModel = TFMBoard()
    private var tfmDatasource: TfmPropertyDataSource
    private var mainView: MainView!

    private var counter: Int = 0 {
        didSet {
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.mainView.generationCounterLabel.text = "Lv: \(self.counter)"
            }
        }
    }


    // MARK: - Init
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.tfmDatasource = TfmPropertyDataSource()
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        tfmDatasource.collectionViewController = self
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Overriden functions

    override func loadView() {
        super.loadView()
        mainView = MainView(nextGenAction: nextGenerationAction)
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupCollectionView()
        loadActions()
    }

    // MARK: - Methods

    private func setupCollectionView() {
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = tfmDatasource
        tfmDatasource.tfmProperties = viewModel.tfmProperties
    }

}

//  MARK: - Collection View Settings


/// Delegate Flow Layout
extension MainCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: collectionView.frame.width, height: 110)
        return size
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForFooterInSection section: Int) -> CGSize {
        let size = CGSize(width: collectionView.frame.width, height: 110)
        return size
    }

}

/// Actions
extension MainCollectionViewController {
    enum Unit {
        case productionFactor
        case quantity
    }

    private func loadActions() {
        mainView.resetButton.addTarget(self, action: #selector(resetValues), for: .touchUpInside)

        // Reset Alert ViewController
        mainView.resetAlert.addAction(.init(title: "OK", style: .default, handler: { (action: UIAlertAction!) in
            let resettedProperties = self.viewModel.resetProperties(self.tfmDatasource.tfmProperties)
            self.tfmDatasource.tfmProperties = resettedProperties

            self.counter = 0

            UIView.performWithoutAnimation {
                self.mainView.collectionView.reloadData()
            }
        }))

        mainView.resetAlert.addAction(.init(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
            self.mainView.resetAlert .dismiss(animated: true, completion: nil)
        }))
    }

    /// Reset all values (Generation counter, quantity, property).
    @objc func resetValues() {
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
        let nextGenerationProperties = viewModel.recalculateQuantity(tfmDatasource.tfmProperties)
        tfmDatasource.tfmProperties = nextGenerationProperties
        counter += 1
        mainView.collectionView.reloadData()
    }

}
