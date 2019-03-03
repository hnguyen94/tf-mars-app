import Foundation

struct Energy: PropertyProtocol, ProductFactorRangeProtocol {
    var title = "Energy"
    var range: [Int] = Array(0...30)
    var quantity: Int = 0
    var productionFactor: Int = 0
}
