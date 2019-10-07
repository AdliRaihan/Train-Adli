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
        tabBar.barTintColor = UIColor.init(rgb: 0xffffff)
        tabBar.tintColor = UIColor.init(rgb: 0x263238)
    }
    
    private func setupTabbar() {
        let tabBarLists = [setupFirstController(),setupSecondController(),setupThirdController(),setupForthController()]
        viewControllers = tabBarLists
    }
    
    private func setupFirstController () -> UIViewController {
        let controller = DashboardViewController()
        controller.tabBarItem = UITabBarItem.init(title: "", image: createTabImage(_NameImage: "ic_tabbar_home"), tag: 0)
        controller.tabBarItem.imageInsets = UIEdgeInsets.init(top: 6, left: 0, bottom: -6, right: 0)
        return controller
    }
    
    private func setupSecondController () -> UIViewController {
        let controller = SVGViewController()
        controller.tabBarItem = UITabBarItem.init(title: "", image: createTabImage(_NameImage: "ic_tabbar_add"), tag: 1)
        controller.tabBarItem.imageInsets = UIEdgeInsets.init(top: 6, left: 0, bottom: -6, right: 0)
        return controller
    }
    
    private func setupThirdController () -> UIViewController {
        
        let controller = ProfileViewController()
        controller.tabBarItem = UITabBarItem.init(title: "", image: createTabImage(_NameImage: "ic_tabbar_add_image"), tag: 2)
        controller.tabBarItem.imageInsets = UIEdgeInsets.init(top: 6, left: 0, bottom: -6, right: 0)
        return controller
    }
    
    private func setupForthController () -> UIViewController {
        let controller = ProfileViewController()
        controller.tabBarItem = UITabBarItem.init(title: "", image: createTabImage(_NameImage: "ic_tabbar_profile"), tag: 3)
        controller.tabBarItem.imageInsets = UIEdgeInsets.init(top: 6, left: 0, bottom: -6, right: 0)
        return controller
    }
    
    private func createTabImage (_NameImage : String) -> UIImage {
        let image = UIImage.init(named: _NameImage)
        let imageShrinked = image?.resize(toWidth: 22)
        imageShrinked?.withRenderingMode(.alwaysTemplate)
        return imageShrinked!
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
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
