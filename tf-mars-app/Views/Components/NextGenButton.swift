import UIKit

extension UIButton {
  static var nextGeneration: UIButton {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setImage(#imageLiteral(resourceName: "nextGeneration"), for: .normal)
    return button
  }
}
