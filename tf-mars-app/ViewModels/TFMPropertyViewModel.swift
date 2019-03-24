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

                let newProperty = makeNewEnergyProperty(of: currentProperty)
                return newProperty
            }

            if isHeat(currentProperty) {
                let newProperty = makeNewHeatProperty(of: energyQuantity, and: currentProperty)
                return newProperty
            }

            // Default behaviour

            let newProperty = makeNewProperty(of: currentProperty)
            return newProperty
        }

        return nextGenProperties
    }
    
     func nextGeneration() {
        tfmProperties = recalculateQuantity(tfmProperties)
    }

    private func makeNewProperty(of currentProperty: TFMPropertyModel) -> TFMPropertyModel {
        let newQuantity = currentProperty.quantity + currentProperty.productionFactor

        return TFMPropertyModel(type: currentProperty.type,
                                quantity: newQuantity,
                                productionFactor: currentProperty.productionFactor)
    }

    private func makeNewEnergyProperty(of currentEnergyProperty: TFMPropertyModel) -> TFMPropertyModel {
        let newQuantity = currentEnergyProperty.productionFactor

        return TFMPropertyModel(type: currentEnergyProperty.type,
                                quantity: newQuantity,
                                productionFactor: currentEnergyProperty.productionFactor)
    }

    private func makeNewHeatProperty(of energyQuantity: Int, and property: TFMPropertyModel) -> TFMPropertyModel {
        let newQuantity = energyQuantity + property.quantity + property.productionFactor

        return TFMPropertyModel(type: property.type,
                                quantity: newQuantity,
                                productionFactor: property.productionFactor)
    }

    private func isEnergy(_ property: TFMPropertyModel) -> Bool {
        return property.type == .energy
    }

    private func isHeat(_ property: TFMPropertyModel) -> Bool {
        return property.type == .heat
    }
    
}
