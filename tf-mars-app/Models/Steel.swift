import Foundation

struct Steel: PropertyProtocol {
    var type: TFMProperty = .steel
    var range: [Int] = Array(0...30)
    var quantity: Int = 0
    var productionFactor: Int = 0
}
