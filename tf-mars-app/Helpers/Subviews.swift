import UIKit

extension UIStackView {
  func addArrangedSubviews(_ views: UIView...) {
    views.forEach { addArrangedSubview($0) }
  }
}

extension UIView {
  func addSubviews(_ views: UIView...) {
    views.forEach { addSubview($0) }
  }
}
