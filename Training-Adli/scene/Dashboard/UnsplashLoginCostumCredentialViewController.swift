//
//  UnsplashLoginCostumCredentialViewController.swift
//  Training-Adli
//
//  Created by Adli Raihan on 26/09/19.
//  Copyright © 2019 Adli Raihan. All rights reserved.
//

import UIKit



protocol unsplashLoginActions : class {
    func understood()
    func nope()
}

class UnsplashLoginCostumCredentialViewController: UIViewController {
    
    weak var delegate : unsplashLoginActions?
    
    @IBOutlet weak var ViewModal: UIView! {
        didSet {
            self.ViewModal.setShadow()
        }
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        createAlphaBackground()
    }
    
    // create effect for focusing ?
    private func createAlphaBackground () {
        UIView.animate(withDuration: 0.25) {
            self.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        }
    }
    // hide effect for focusing ?
    private func hideAlphaBackground () {
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0)
    }
    // when user aggreed
    @IBAction func understoodActions(_ sender: Any) {
        hideMe {
            self.dismiss(animated: true) {
                self.delegate?.understood()
            }
        }
    }
    // when use disaggree
    @IBAction func nopeActions(_ sender: Any) {
        hideMe {
             self.dismiss(animated: true, completion: nil)
        }
    }
    // hide
    private func hideMe (completion: @escaping () -> Void ) {
        UIView.animate(withDuration: 0.25, animations: {
            self.hideAlphaBackground()
        }) { (finish) in
            if finish { completion() }
        }
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
