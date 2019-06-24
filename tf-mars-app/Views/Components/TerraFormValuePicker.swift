import UIKit

extension UIPickerView {
  static var terraFormValue: UIPickerView {
    let picker = UIPickerView()
    picker.translatesAutoresizingMaskIntoConstraints = false
    picker.backgroundColor = .white
    return picker
  }
}

extension UIToolbar {
  /// Default `isHidden` is set to true
  static var terraFormValue: UIToolbar {
    let toolbar = UIToolbar()
    toolbar.translatesAutoresizingMaskIntoConstraints = false
    toolbar.barStyle = .blackTranslucent
    toolbar.tintColor = .black
    toolbar.isHidden = true
    toolbar.isTranslucent = true
    return toolbar
  }
}
