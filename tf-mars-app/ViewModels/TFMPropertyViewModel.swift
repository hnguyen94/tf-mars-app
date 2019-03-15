import Foundation

class TFMPropertyViewModel {
    
    // MARK: - Properties
    var megaCredit = TFMPropertyModel(type: .megaCredit)
    var steel = TFMPropertyModel(type: .steel)
    var titan = TFMPropertyModel(type: .titan)
    var plant = TFMPropertyModel(type: .plant)
    var energy = TFMPropertyModel(type: .energy)
    var heat = TFMPropertyModel(type: .heat)

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


    /// Will mutate megaCredit property with a recalculated Energy model.
    ///
    /// `newQuantity` = CurrentProductionFactor
    /// The current `quantity` will be converted to heat.
//    mutating func recalculateEnergy() {
//        let newQuantity = energy.productionFactor
//        energy = TFMPropertyModel(type: .energy,
//                                 quantity: newQuantity,
//                                 productionFactor: energy.productionFactor)
//
//    }
//
//    /// Will mutate megaCredit property with a recalculated Energy model.
//    ///
//    /// `newQuantity` = CurrentProductionFactor + CurrentQuantity + EnergyQuantity
//    /// This method should be called before `recalculateEnergy` to get the current energy.
//    mutating func recalculateHeat(from energy: TFMPropertyModel) {
//        guard energy.type == .energy else {
//            assertionFailure("Wront type! Type must be energy.")
//            return
//        }
//
//        let newQuantity = heat.productionFactor + heat.quantity + energy.quantity
//        heat = TFMPropertyModel(type: .heat,
//                                  quantity: newQuantity,
//                                  productionFactor: energy.productionFactor)
//
//    }

    func recalculateQuantity(_ oldProperties: [TFMPropertyModel]) {
        let nextGenProperties = oldProperties.map { currentProperty -> TFMPropertyModel in
            let newQuantity = currentProperty.quantity + currentProperty.productionFactor

            return TFMPropertyModel(type: currentProperty.type,
                                    quantity: newQuantity,
                                    productionFactor: currentProperty.productionFactor)
        }

        tfmProperties = nextGenProperties
    }
    
     func nextGeneration() {
        recalculateQuantity(tfmProperties)
    }
    
}
