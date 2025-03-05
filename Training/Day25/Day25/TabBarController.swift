//
//  TabBarController.swift
//  Day25
//
//  Created by 신승재 on 3/5/25.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      let homeVC = MainViewController()
      let settingsVC = SettingViewController()
      let profileVC = ProfileViewController()
      
      homeVC.tabBarItem =
      UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
      settingsVC.tabBarItem =
      UITabBarItem(tabBarSystemItem: .more, tag: 1)
      profileVC.tabBarItem =
      UITabBarItem(tabBarSystemItem: .contacts, tag: 2)
      
      self.viewControllers = [homeVC, settingsVC, profileVC]
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
