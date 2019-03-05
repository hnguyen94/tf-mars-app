import Foundation

struct Plant: TFMPropertyProtocol {
    var type: TFMProperty = .plant
    var range: [Int] = Array(0...30)
    var quantity: Int = 0
    var productionFactor: Int = 0
}
