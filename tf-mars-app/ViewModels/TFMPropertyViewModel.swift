import Foundation

struct TFMPropertyViewModel {
    
    // MARK: - Properties
    
    let megaCredit = TFMPropertyModel(type: .megaCredit)
    let steel = TFMPropertyModel(type: .steel)
    let titan = TFMPropertyModel(type: .titan)
    let plant = TFMPropertyModel(type: .plant)
    let energy = TFMPropertyModel(type: .energy)
    let heat = TFMPropertyModel(type: .heat)

    var tfmProperties: [TFMPropertyModel]
    
    
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
    
}
