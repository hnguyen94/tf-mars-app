import UIKit

extension UIButton {
  static var increment: UIButton {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setImage(#imageLiteral(resourceName: "increment.pdf"), for: .normal)
    return button
  }

  static var decrement: UIButton {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setImage(#imageLiteral(resourceName: "decrement.pdf"), for: .normal)
    return button
  }
}
