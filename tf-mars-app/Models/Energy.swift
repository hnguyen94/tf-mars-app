import Foundation

struct Energy: TFMPropertyProtocol {
    var type: TFMProperty = .energy
    var range: [Int] = Array(0...30)
    var quantity: Int = 0
    var productionFactor: Int = 0
}
