import Foundation

struct Money: PropertyProtocol {
    var type: TFMProperty = .megaCredit
    var range: [Int] = Array(-30...30)
    var quantity: Int = 0
    var productionFactor: Int = 0
}
