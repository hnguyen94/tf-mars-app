import Foundation

struct Heat: PropertyProtocol, ProductFactorRangeProtocol {
    var title = "Heat"
    var range: [Int] = Array(0...30)
    var quantity: Int = 0
    var productionFactor: Int = 0
}
