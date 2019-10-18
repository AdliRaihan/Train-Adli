//
//  AppDelegate.swift
//  Training-Adli
//
//  Created by Adli Raihan on 11/09/19.
//  Copyright © 2019 Adli Raihan. All rights reserved.
//

import UIKit
import CoreData
import UserNotifications
import SwiftyUserDefaults
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate , UNUserNotificationCenterDelegate {

    static let shared = AppDelegate()
    var window: UIWindow?

    lazy var persistentContainer : NSPersistentContainer  = {
        let container = NSPersistentContainer.init(name: "login_credenstial")
        container.loadPersistentStores { (description, error) in
            if let _error = error as NSError? {
                
            }
        }
        return container
    }()
    
    lazy var context : NSManagedObjectContext = {
       return persistentContainer.viewContext
    }()
    
    func autoSaveContext () {
        if context.hasChanges {
            print("### Saved!")
            do {
                try context.save()
            } catch {
                fatalError("\(String(describing: error._userInfo))")
            }
        }
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.deleteAllCoreData(required: "Entity")
        self.setupNewRootController()
        self.requestAccessNotification()
        self._realmConfig()
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        if url.host == "oauth-callback" {
            
        }
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert,.sound,.badge])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        "Response Identifier".createMessage(message: response.notification.request.identifier)
        
    }

}

extension AppDelegate {
    private func setupNewRootController () {
        let rootController : UINavigationController  = UINavigationController.init(nibName: nil, bundle: nil)
        rootController.viewControllers = [LoginViewController.init(nibName: "LoginViewController", bundle: nil)]
        
        rootController.navigationBar.barStyle = .black
        rootController.navigationBar.tintColor = UIColor.white
        rootController.navigationBar.barTintColor = UIColor.init(rgb: 0x232526)
        
        if let _window = window {
            "AppDelegate".createMessage( message: "Initialize Root View Controller" )
            
            if Defaults[.userAuthenticationCode].isEmpty {
                rootController.setNavigationBarHidden(true, animated: false)
                
                _window.rootViewController = rootController
            } else {
                let otherRoot = UINavigationController.init(rootViewController: DashboardTabBarViewController())
                otherRoot.setNavigationBarHidden(true, animated: false)
                
                _window.rootViewController = otherRoot
            }
        }
    }
    
    private func manualRoot () {
        let otherRoot = UINavigationController.init(rootViewController: DashboardTabBarViewController())
        otherRoot.setNavigationBarHidden(true, animated: false)
        if let _window = window {
            _window.rootViewController = otherRoot
        }
    }
    
    private func requestAccessNotification() {
        let notificationCenter = UNUserNotificationCenter.current()
        let options : UNAuthorizationOptions  = [.alert,.sound,.badge]
        
        notificationCenter.delegate = self
        
        notificationCenter.requestAuthorization(options: options) { (isGranted, error) in
            guard error == nil else {return}
            
            if !isGranted {
                print("Declined!")
            }
            
        }
    }
    
    private func _realmConfig () {
        let configuration = Realm.Configuration( schemaVersion : 1 )
        // -
        Realm.Configuration.defaultConfiguration = configuration
    }
}

extension AppDelegate {
    private func deleteAllCoreData (required entityName : String) {
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        fetchRequest.returnsObjectsAsFaults = false
        do {
            let results = try context.fetch(fetchRequest)
            for object in results {
                guard let objectData = object as? NSManagedObject else {continue}
                context.delete(objectData)
                "AppDelegate".createMessage(message: "Deleting succeed")
            }
        } catch let error {
            print("Detele all data in error :", error)
        }
        
    }
}

