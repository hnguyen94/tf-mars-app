import UIKit

// MARK: - Main

class GenerationPickerDatasourceDelegate: NSObject {
    var items = [Int]()
}

// MARK: - DataSource

extension GenerationPickerDatasourceDelegate: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return items.count
    }
}

// MARK: - Delegate

extension GenerationPickerDatasourceDelegate: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int) -> String? {
        return "\(items[row])"
    }
}
