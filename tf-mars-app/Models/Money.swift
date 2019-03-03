import Foundation

struct Money: PropertyProtocol, ProductFactorRangeProtocol {
    var title = "Mega Credits"
    var range: [Int] = Array(-30...30)
    var quantity: Int = 0
    var productionFactor: Int = 0
}
