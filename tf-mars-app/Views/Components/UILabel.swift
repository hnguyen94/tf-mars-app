import UIKit

extension UILabel {
  static var title: UILabel {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Terra Form Board"
    label.font = UIFont.systemFont(ofSize: 24)
    label.textColor = UIColor.TFMOrange.light
    return label
  }
  
  static var generation: UILabel {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.systemFont(ofSize: 16)
    label.textColor = UIColor.TFMOrange.light
    label.textAlignment = .center
    return label
  }
}
