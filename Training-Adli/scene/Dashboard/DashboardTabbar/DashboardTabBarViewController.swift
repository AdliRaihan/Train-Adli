//
//  DashboardTabBarViewController.swift
//  Training-Adli
//
//  Created by Stella Patricia on 03/10/19.
//  Copyright © 2019 Adli Raihan. All rights reserved.
//

import UIKit

class DashboardTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupTabbar()
        setupUITabbar()
    }
    
    private func setupUITabbar() {
        tabBar.barTintColor = UIColor.init(rgb: 0xb0bec5)
        tabBar.tintColor = UIColor.init(rgb: 0x263238)
    }
    
    private func setupTabbar() {
        let tabBarLists = [setupFirstController(),setupSecondController()]
        viewControllers = tabBarLists
    }
    
    private func setupFirstController () -> UIViewController {
        let firstController = DashboardViewController()
        firstController.tabBarItem = UITabBarItem.init(title: "", image: createTabImage(_NameImage: "ic_tabbar_images"), tag: 0)
        firstController.tabBarItem.imageInsets = UIEdgeInsets.init(top: 6, left: 0, bottom: -6, right: 0)
        return firstController
    }
    
    private func setupSecondController () -> UIViewController {
        let secondController = ProfileViewController()
        secondController.tabBarItem = UITabBarItem.init(title: "", image: createTabImage(_NameImage: "ic_tabbar_profile"), tag: 1)
        secondController.tabBarItem.imageInsets = UIEdgeInsets.init(top: 6, left: 0, bottom: -6, right: 0)
        return secondController
    }
    
    private func createTabImage (_NameImage : String) -> UIImage {
        let image = UIImage.init(named: _NameImage)
        let imageShrinked = image?.resize(toWidth: 18)
        imageShrinked?.withRenderingMode(.alwaysTemplate)
        return imageShrinked!
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
