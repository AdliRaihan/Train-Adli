//
//  DashboardViewController.swift
//  Training-Adli
//
//  Created by Stella Patricia on 16/09/19.
//  Copyright © 2019 Adli Raihan. All rights reserved.
//

import UIKit
import WebKit

struct userInformations {
    var codeAuthorization : String = "" 
}

class DashboardViewController: UIViewController {

    @IBOutlet weak var wbView: WKWebView!
    @IBOutlet weak var profileViewHolderShadow: UIView!
    @IBOutlet weak var profileViewHolder: UIView!
    @IBOutlet weak var imageProfile : UIImageView!
    
    @IBOutlet weak var VerificationsImageView: UIImageView!
    @IBOutlet weak var LevelLabel: UILabel!
    @IBOutlet weak var LavelStaticLabel: UILabel!
    
    /* Menu Top */
    @IBOutlet weak var itemsMenuTop: UIView!
    @IBOutlet weak var itemsMenuTopImage : UIImageView!
    /* Menu Second */
    @IBOutlet weak var itemsMenuSecond: UIView!
    @IBOutlet weak var itemsMenuSecondImage: UIImageView!
    /* Menu Third */
    @IBOutlet weak var itemsMenuThird: UIView!
    @IBOutlet weak var itemsMenuThirdImage : UIImageView!
    /* UserInformation */
    var userInfo : userInformations = userInformations()
    
    private var caGradient = CAGradientLayer()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupUI()
        setupObserver()
    }

    private func setupUI () {
        setupProfileViewHolder ()
        setupTopMenu()
        setupSecondMenu()
        setupThirdMenu()
        profileViewHolderShadow.setShadow()
        imageProfile.circleRadius()
    }
    
    private func setupObserver () {
        self.wbView.addObserver(self, forKeyPath: "URL", options: .new, context: nil)
        self.wbView.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == #keyPath(WKWebView.url) {
            let url = self.wbView.url!
            if let safeUrl = url.query , safeUrl.contains("code=") {
                self.userInfo.codeAuthorization = safeUrl.replacingOccurrences(of: "code=", with: "")
                createAuthorization()
            } else { return }
        }
    }
    
    private func createAuthorization () {
        let request = unsplash.oauthTokenModel.tokenRequest()
        request.clientId = ConstantVariables.clientId
        request.scope = ConstantVariables.scope
        request.redirectUrl = ConstantVariables.redirectUrl
        request.secretKey = ConstantVariables.secretKey
        request.code = self.userInfo.codeAuthorization
        AuthWorker().getToken(request) { (result) in
            
        }
    }
    
    private func setupProfileViewHolder () {
        guard LevelLabel != nil else { return }
        caGradient = UIColor().gradientAtDashboard()!
        caGradient.frame = profileViewHolder.bounds
        profileViewHolder.layer.insertSublayer(caGradient, at: 0)
        profileViewHolder.constantRadius()
        VerificationsImageView.image = #imageLiteral(resourceName: "ic_verifications").withRenderingMode(.alwaysTemplate)
        VerificationsImageView.tintColor = UIColor.init(named: "#4fc3f7")
        LevelLabel.textDropShadow(withColor: LevelLabel!.textColor)
    }
    
    private func setupTopMenu () {
        itemsMenuTop.setShadow()
        itemsMenuTop.constantRadius()
        itemsMenuTopImage.image = #imageLiteral(resourceName: "ic_cards").withRenderingMode(.alwaysTemplate)
        itemsMenuTopImage.tintColor = UIColor.darkGray
    }
    
    private func setupSecondMenu () {
        itemsMenuSecond.setShadow()
        itemsMenuSecond.constantRadius()
        itemsMenuSecondImage.image = #imageLiteral(resourceName: "ic_badge_shop").withRenderingMode(.alwaysTemplate)
        itemsMenuSecondImage.tintColor = UIColor.darkGray
        itemsMenuSecond.isUserInteractionEnabled = true
        itemsMenuSecond.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(exploreGesture(_:))))
    }
    
    private func setupThirdMenu () {
        itemsMenuThird.setShadow()
        itemsMenuThird.constantRadius()
        itemsMenuThirdImage.image = #imageLiteral(resourceName: "ic_funds_colored").withRenderingMode(.alwaysTemplate)
    }
    
    @objc func exploreGesture (_ sender : Any) {
        let unsplashRequest = unsplash.AuthRequest.init()
        unsplashRequest.clientId = ConstantVariables.clientId
        unsplashRequest.redirectUrl = ConstantVariables.redirectUrl
        unsplashRequest.responseType = ConstantVariables.responseType
        unsplashRequest.scope = ConstantVariables.scope
        
        AuthWorker().getAuth(unsplashRequest) { (value) in
            switch value {
            case .success(_ ) :
                self.wbView.clearCache()
                self.wbView.isHidden = false
                self.wbView.load(URLRequest.init(url: URL.init(string: ConstantVariables.urlToGetAuthorization)!))
                break
            }
        }
        
    }

    // Hide Web View Actions
    @IBAction func hideWebViewAction(_ sender: Any) {
        // Hide webview action dipencet
        self.wbView.isHidden = true
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

extension DashboardViewController {
}
