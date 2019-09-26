//
//  BaseViewController.swift
//  Training-Adli
//
//  Created by Adli Raihan on 11/09/19.
//  Copyright © 2019 Adli Raihan. All rights reserved.
//

import UIKit
import SVProgressHUD
import CoreData

class BaseViewController: UIViewController {

    fileprivate weak var appDelegate = AppDelegate.shared
    var context : NSManagedObjectContext?
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCoreData()
        setupNavigation()
    }
    
    private func setupCoreData () {
        appDelegate = UIApplication.shared.delegate as? AppDelegate
        if let _appDelegate = appDelegate {
            context = _appDelegate.context
        }
    }
    
    private func setupNavigation () {
        self.navigationItem.backBarButtonItem = UIBarButtonItem.init(title: "", style: .plain, target: nil, action: nil)
    }
    
    func setupTitle(Title : String) {
        self.navigationItem.title = Title
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.navigationItem.backBarButtonItem = UIBarButtonItem.init(title: "", style: .done, target: nil, action: nil)
    }
    
    func showLoading (_ message : String ) {
        SVProgressHUD.show(withStatus: message)
    }
    
    func hideLoading (_ message : String ) {
        SVProgressHUD.dismiss(withDelay: 1)
    }

}

extension BaseViewController {
    func insertOnEntityLogin ( dataModel : cModelFor.Entity , dataModelKey : cModelFor.EntityKey = cModelFor.EntityKey() ) {
        let entityUser = getEntity(Identifier: "Entity")
        entityUser.setValue(dataModel.uid, forKey: dataModelKey.uid)
        entityUser.setValue(dataModel.username, forKey: dataModelKey.username)
        entityUser.setValue(dataModel.email, forKey: dataModelKey.email)
        saveContext()
    }
}



extension BaseViewController {
    private func getEntity ( Identifier entity : String ) -> NSManagedObject {
        let _entity = NSEntityDescription.entity(forEntityName: entity, in: context!)
        return NSManagedObject.init(entity: _entity!, insertInto: context!)
    }
    
    private func saveContext () {
        
        "BaseViewController".createMessage(message: "Save Context Functions!")
        
        if context!.hasChanges {
            do {
                try context!.save()
                "BaseViewController".createMessage(message: "SAVED !!!")
            } catch {
                fatalError("\(String(describing: error._userInfo))")
            }
        }
        
    }
}
