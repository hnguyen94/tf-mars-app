import Foundation

struct Steel: PropertyProtocol, ProductFactorRangeProtocol {
    var title = "Steel"
    var range: [Int] = Array(0...30)
    var quantity: Int = 0
    var productionFactor: Int = 0
}
