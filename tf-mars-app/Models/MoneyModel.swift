import Foundation

struct MoneyModel: PropertyProtocol, ProductFactorRangeProtocol {
    var range: [Int] = Array(-30...30)
    var quantity: Int = 0
    var productionFactor: Int = 0
}
