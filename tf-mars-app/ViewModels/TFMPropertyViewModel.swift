import Foundation

class TFMPropertyViewModel {
    
    // MARK: - Properties
    private var megaCredit = TFMPropertyModel(type: .megaCredit)
    private var steel = TFMPropertyModel(type: .steel)
    private var titan = TFMPropertyModel(type: .titan)
    private var plant = TFMPropertyModel(type: .plant)
    private var energy = TFMPropertyModel(type: .energy)
    private var heat = TFMPropertyModel(type: .heat)

    var tfmProperties: [TFMPropertyModel]
    
    // MARK: - Init
    
    init() {
        self.tfmProperties = [
            megaCredit,
            steel,
            titan,
            plant,
            energy,
            heat
        ]
    }
    
    // MARK: - Functions

    func recalculateQuantity(_ oldProperties: [TFMPropertyModel]) -> [TFMPropertyModel] {

        var energyQuantity = 0
        let nextGenProperties = oldProperties.map { currentProperty -> TFMPropertyModel in
            if isEnergy(currentProperty) {
                energyQuantity = currentProperty.quantity
                let newQuantity = currentProperty.productionFactor

                return TFMPropertyModel(type: currentProperty.type,
                                 quantity: newQuantity,
                                 productionFactor: currentProperty.productionFactor)
            }

            if isHeat(currentProperty) {
                let newQuantity = currentProperty.productionFactor + currentProperty.quantity + energyQuantity

                return TFMPropertyModel(type: currentProperty.type,
                                        quantity: newQuantity,
                                        productionFactor: currentProperty.productionFactor)
            }

            // Default behaviour

            let newQuantity = currentProperty.quantity + currentProperty.productionFactor

            return TFMPropertyModel(type: currentProperty.type,
                                    quantity: newQuantity,
                                    productionFactor: currentProperty.productionFactor)
        }

        return nextGenProperties
    }
    
     func nextGeneration() {
        tfmProperties = recalculateQuantity(tfmProperties)
    }

    private func isEnergy(_ property: TFMPropertyModel) -> Bool {
        return property.type == .energy
    }

    private func isHeat(_ property: TFMPropertyModel) -> Bool {
        return property.type == .heat
    }
    
}
