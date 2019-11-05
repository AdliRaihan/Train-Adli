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
    fileprivate var loadingView : UIView! = UIView()
    fileprivate var shadowView : UIView! = UIView()
    fileprivate var viewHolder : UIView! = UIView()
    
    var timerLoading : Timer = Timer()
    var context : NSManagedObjectContext?
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCoreData()
        setupNavigation()
    }
    
    private func _loadingView () -> UIView {
        let loading = UIView.init(frame: .init(x: -50, y: 0, width: 50, height: 2))
        loading.backgroundColor = UIColor.init(rgb: 0x1c313a)
        loading.circleRadius()
        return loading
    }
    
    private func _manipulateShadow () -> UIView {
        let shadow = UIView.init(frame: .init(x: -50, y: 2, width: 50, height: 3))
        shadow.backgroundColor = UIColor.init(rgb: 0x1c313a).withAlphaComponent(0.1)
        shadow.circleRadius()
        return shadow
    }
    
    func setupLoading(_view : UIView) {
        self.loadingView = _loadingView()
        self.shadowView = _manipulateShadow()
        self.viewHolder = _view
        
        
        viewHolder.addSubview(loadingView)
        viewHolder.addSubview(shadowView)
        showLoading()
        timerLoading = Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { (timer) in
            self.showLoading()
        }
        
    }
    
    private func showLoading () {
        let frame = viewHolder.frame
        self.loadingView.frame = .init(x: -50, y: 0, width: 50, height: 2)
        self.shadowView.frame = .init(x: -50, y: 2, width: 50, height: 3)
        UIView.animate(withDuration: 1, animations: {
            self.loadingView.frame = .init(x: frame.width / 3, y: 0, width: frame.width / 2, height: 2)
            self.shadowView.frame = .init(x: frame.width / 3, y: 2, width: frame.width / 2, height: 3)
        }) { (finish) in
            UIView.animate(withDuration: 1, animations: {
                self.loadingView.frame = .init(x: frame.width + 75, y: 0, width: 50, height: 2)
                self.shadowView.frame = .init(x: frame.width + 75, y: 2, width: 50, height: 3)
            })
        }
    }
    
    func dismissLoading () {
        guard (loadingView != nil) && (shadowView != nil) else {return}
        timerLoading.invalidate()
        
        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { (timer) in
            self.loadingView.frame = .init(x: 0, y: 0, width: 0, height: 2)
            UIView.animate(withDuration: 1, delay: 0, options: [.curveEaseInOut], animations: {
                self.loadingView.frame = .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 1)
            }) { (finish) in
                self.fadeView(_view: self.viewHolder)
            }
            
        }
    }
    
    func fadeView( _view : UIView) {
        UIView.animate(withDuration: 0.5, delay: 0, options: [.curveEaseInOut], animations: {
            self.loadingView.alpha = 0.25
            self.shadowView.alpha = 0.25
        }) { (Bool) in
//            self.loadingView.removeFromSuperview()
//            self.shadowView.removeFromSuperview()
        }
    }
    
    private func setupCoreData () {
        appDelegate = UIApplication.shared.delegate as? AppDelegate
        if let _appDelegate = appDelegate {
            context = _appDelegate.context
        }
    }
    
    private func setupNavigation () {
        self.navigationItem.backBarButtonItem = UIBarButtonItem.init(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.barTintColor = UIColor.init(rgb: ConstantColor.colorPrimaryScheme().PrimaryDarkFlat)
    }
    
    func setupTitle(Title : String) {
        self.navigationItem.title = Title
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.navigationItem.backBarButtonItem = UIBarButtonItem.init(title: "", style: .done, target: nil, action: nil)
    }
    
    func showLoading (_ message : String ) {
        if message == "" {
            SVProgressHUD.show()
        } else {
            SVProgressHUD.show(withStatus: message)
        }
    }
    
    func hideLoading (_ message : String ) {
        SVProgressHUD.dismiss(withDelay: 1)
    }
    
    func showAlert (_message : String) {
        let alertController = UIAlertController.init(title: "", message: _message, preferredStyle: .alert)
        
        let alertAction = UIAlertAction.init(title: "OK", style: .default) { (UIAlertAction) in
            alertController.dismiss(animated: true, completion: nil)
        }
        
        alertController.addAction(alertAction)
        
        self.present(alertController, animated: true, completion: nil)
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
