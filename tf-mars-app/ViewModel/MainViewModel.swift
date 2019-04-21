import Foundation

struct MainViewModel {
  func displayGeneration(with lvl: Int) -> String {
    return "Lvl: \(lvl)"
  }
  
  func displayTerraForm(with value: Int) -> String {
    return "TF: \(value)"
  }
}
