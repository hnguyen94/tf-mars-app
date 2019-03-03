import Foundation

struct Titan: PropertyProtocol, ProductFactorRangeProtocol {
    var title = "Titan"
    var range: [Int] = Array(0...30)
    var quantity: Int = 0
    var productionFactor: Int = 0
}
