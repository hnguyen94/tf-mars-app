import Foundation

class TFMBoard {
  
  // MARK: - Properties
  
  // MARK: Private
  
  private let megaCredit = TFMPropertyModel(type: .megaCredit)
  private let steel = TFMPropertyModel(type: .steel)
  private let titan = TFMPropertyModel(type: .titan)
  private let plant = TFMPropertyModel(type: .plant)
  private let energy = TFMPropertyModel(type: .energy)
  private let heat = TFMPropertyModel(type: .heat)
  
  // MARK: Public
  
  var generation: Int = 0 {
    didSet {
      didChangeGeneration?()
    }
  }
  
  var terraForm: Int = 20 {
    didSet {
      didChangeTerraForm?()
    }
  }
  
  var tfmProperties: [TFMPropertyModel]
  var didChangeGeneration: (() -> Void)?
  var didChangeTerraForm: (() -> Void)?
  
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
      if currentProperty.isEnergy {
        energyQuantity = currentProperty.quantity
        
        let newProperty = makeNewEnergyProperty(of: currentProperty)
        return newProperty
      }
      
      if currentProperty.isHeat {
        let newProperty = makeNewHeatProperty(of: energyQuantity, and: currentProperty)
        return newProperty
      }
      
      // Default behaviour
      
      let newProperty = makeNextGenProperty(of: currentProperty)
      return newProperty
    }
    
    return nextGenProperties
  }
  
  func resetProperties(_ oldProperties: [TFMPropertyModel]) -> [TFMPropertyModel] {
    let resettedProperties = oldProperties.map { currentProperty -> TFMPropertyModel in
      return TFMPropertyModel(type: currentProperty.type, quantity: 0, productionFactor: 0)
    }
    
    return resettedProperties
  }
  
  private func makeNextGenProperty(of currentProperty: TFMPropertyModel) -> TFMPropertyModel {
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
  
}

extension TFMPropertyModel {
  var isEnergy: Bool {
    return type == .energy
  }
  
  var isHeat: Bool {
    return type == .heat
  }
}
