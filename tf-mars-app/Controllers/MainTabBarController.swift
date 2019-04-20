import UIKit

class MainTabBarController: UITabBarController {
  
  let mainCollectionVC = MainViewController()
  let settingsTableVC = SettingsTableViewController()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    mainCollectionVC.tabBarItem = UITabBarItem(title: "Main", image: nil, tag: 0)
    settingsTableVC.tabBarItem = UITabBarItem(title: "Settings", image: nil, tag: 0)
    
    let tabBarList = [mainCollectionVC, settingsTableVC]
    
    viewControllers = tabBarList
  }
  
  
  // MARK: - Navigation
  
  
}
