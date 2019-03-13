import Foundation

struct TFMPropertyViewModel {
    
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

    /// Will mutate megaCredit property with a recalculated MegaCredit model.
    ///
    /// `newQuantity` = CurrentProductionFactor + CurrentQuantity
    mutating func recalculateMegaCredits() {
       let newQuantity = megaCredit.productionFactor + megaCredit.quantity
        megaCredit = TFMPropertyModel(type: .megaCredit,
                                      quantity: newQuantity,
                                      productionFactor: megaCredit.productionFactor)
    }
    
    /// Will mutate megaCredit property with a recalculated Steel model.
    ///
    /// `newQuantity` = CurrentProductionFactor + CurrentQuantity
    mutating func recalculateSteel() {
       let newQuantity = steel.productionFactor + steel.quantity
        steel = TFMPropertyModel(type: .steel,
                                 quantity: newQuantity,
                                 productionFactor: steel.productionFactor)
        
    }
    
    /// Will mutate megaCredit property with a recalculated Titan model.
    ///
    /// `newQuantity` = CurrentProductionFactor + CurrentQuantity
    mutating func recalculateTitan() {
        let newQuantity = titan.productionFactor + titan.quantity
        titan = TFMPropertyModel(type: .titan,
                                 quantity: newQuantity,
                                 productionFactor: titan.productionFactor)
        
    }
    
    /// Will mutate megaCredit property with a recalculated Plant model.
    ///
    /// `newQuantity` = CurrentProductionFactor + CurrentQuantity
    mutating func recalculatePlant() {
        let newQuantity = plant.productionFactor + plant.quantity
        plant = TFMPropertyModel(type: .plant,
                                 quantity: newQuantity,
                                 productionFactor: plant.productionFactor)
        
    }

    /// Will mutate megaCredit property with a recalculated Energy model.
    ///
    /// `newQuantity` = CurrentProductionFactor
    /// The current `quantity` will be converted to heat.
    mutating func recalculateEnergy() {
        let newQuantity = energy.productionFactor
        energy = TFMPropertyModel(type: .energy,
                                 quantity: newQuantity,
                                 productionFactor: energy.productionFactor)
        
    }
    
    /// Will mutate megaCredit property with a recalculated Energy model.
    ///
    /// `newQuantity` = CurrentProductionFactor + CurrentQuantity + EnergyQuantity
    /// This method should be called before `recalculateEnergy` to get the current energy.
    mutating func recalculateHeat(from energy: TFMPropertyModel) {
        guard energy.type == .energy else {
            assertionFailure("Wront type! Type must be energy.")
            return
        }
        
        let newQuantity = heat.productionFactor + heat.quantity + energy.quantity
        heat = TFMPropertyModel(type: .heat,
                                  quantity: newQuantity,
                                  productionFactor: energy.productionFactor)
        
    }
    
     mutating func nextGeneration() {
        recalculateMegaCredits()
        recalculateSteel()
        recalculateTitan()
        recalculatePlant()
        recalculateHeat(from: energy)
        recalculateEnergy()
    }
    
}
