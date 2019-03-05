import Foundation

struct Heat: TFMPropertyProtocol {
    var type: TFMProperty = .heat
    var range: [Int] = Array(0...30)
    var quantity: Int = 0
    var productionFactor: Int = 0
}
