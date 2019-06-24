import Foundation

struct MainViewModel {
  func displayGeneration(with lvl: Int) -> String {
    return "Generation: \(lvl)"
  }
  
  func displayTerraForm(with value: Int) -> String {
    return "Terra Form Value: \(value)"
  }
}
