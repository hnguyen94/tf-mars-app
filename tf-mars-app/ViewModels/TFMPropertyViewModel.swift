import Foundation

struct TFMPropertyViewModel {
    var tfmProperties: [TFMPropertyProtocol]
    
    init(tfmProperties: [TFMPropertyProtocol]) {
        self.tfmProperties = tfmProperties
    }
}
