import UIKit

// MARK: - Main

class GenerationPickerData: NSObject {
  let items = Array(20...150)
  var tfmBoard: TFMBoard?
}

// MARK: - DataSource

extension GenerationPickerData: UIPickerViewDataSource {
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  
  func pickerView(_ pickerView: UIPickerView,
                  numberOfRowsInComponent component: Int) -> Int {
    return items.count
  }
}

// MARK: - Delegate

extension GenerationPickerData: UIPickerViewDelegate {
  func pickerView(_ pickerView: UIPickerView,
                  titleForRow row: Int,
                  forComponent component: Int) -> String? {
    return "\(items[row])"
  }
  
  func pickerView(_ pickerView: UIPickerView,
                  didSelectRow row: Int,
                  inComponent component: Int) {
      let item = items[row]
    tfmBoard?.terraForm = item
  }
}
