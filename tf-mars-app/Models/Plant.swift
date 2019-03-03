import Foundation

struct Plant: PropertyProtocol, ProductFactorRangeProtocol {
    var title = "Plant"
    var range: [Int] = Array(0...30)
    var quantity: Int = 0
    var productionFactor: Int = 0
}
