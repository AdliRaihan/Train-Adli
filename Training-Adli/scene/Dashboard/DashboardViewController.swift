//
//  DashboardViewController.swift
//  Training-Adli
//
//  Created by Adli Raihan on 16/09/19.
//  Copyright © 2019 Adli Raihan. All rights reserved.
//

import UIKit
import WebKit

struct userInformations {
    var codeAuthorization : String = "" 
}

class DashboardViewController: BaseViewController {

    
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
    }

    private func setupUI () {
        setupProfileViewHolder ()
        setupTopMenu()
        setupSecondMenu()
        setupThirdMenu()
        profileViewHolderShadow.setShadow()
        imageProfile.circleRadius()
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
        createCAGradientFrame()
        profileViewHolder.layer.insertSublayer(caGradient, at: 0)
        profileViewHolder.constantRadius()
        VerificationsImageView.image = #imageLiteral(resourceName: "ic_verifications").withRenderingMode(.alwaysTemplate)
        VerificationsImageView.tintColor = UIColor.init(named: "#4fc3f7")
        LevelLabel.textDropShadow(withColor: LevelLabel!.textColor)
    }
    
    private func createCAGradientFrame () {
        let frame = profileViewHolder.frame
        let bounds = CGRect.init(x: 0, y: 0,
                                 width: UIScreen.main.bounds.width,
                                 height: frame.bounds.height + frame.origin.y)
        caGradient = UIColor().gradientAtDashboard()!
        caGradient.frame = bounds
    }
    
    private func setupTopMenu () {
        itemsMenuTop.changeColorPrimary(_color: .primaryDarkFlat)
        itemsMenuTop.setShadow()
        itemsMenuTop.constantRadius()
        itemsMenuTopImage.image = #imageLiteral(resourceName: "ic_cards").withRenderingMode(.alwaysTemplate)
        itemsMenuTopImage.tintColor = UIColor.white
    }
    
    private func setupSecondMenu () {
        itemsMenuSecond.changeColorPrimary(_color: .primaryDarkFlat)
        itemsMenuSecond.setShadow()
        itemsMenuSecond.constantRadius()
        itemsMenuSecondImage.image = #imageLiteral(resourceName: "ic_badge_shop").withRenderingMode(.alwaysTemplate)
        itemsMenuSecondImage.tintColor = UIColor.white
        itemsMenuSecond.isUserInteractionEnabled = true
        itemsMenuSecond.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(exploreGesture(_:))))
    }
    
    private func setupThirdMenu () {
        itemsMenuThird.changeColorPrimary(_color: .primaryDarkFlat)
        itemsMenuThird.setShadow()
        itemsMenuThird.constantRadius()
        itemsMenuThirdImage.image = #imageLiteral(resourceName: "ic_funds_colored").withRenderingMode(.alwaysTemplate)
    }
    
    @objc func exploreGesture (_ sender : Any) {
        prepareExec()
    }
    
    // Prepare Exec
    private func prepareExec () {
        self.present(initializeModal(), animated: true)
    }
    // Execution
    private func execLogin () {
        let unsplashRequest = unsplash.AuthRequest.init()
        unsplashRequest.clientId = ConstantVariables.clientId
        unsplashRequest.redirectUrl = ConstantVariables.redirectUrl
        unsplashRequest.responseType = ConstantVariables.responseType
        unsplashRequest.scope = ConstantVariables.scope
        self.showLoading("This might take a while...")
        
        AuthWorker().getAuth(unsplashRequest) { (value) in
            switch value {
            case .success(_ ) :
//                self.wbView.clearCache()
//                self.wbView.isHidden = false
//                self.wbView.load(URLRequest.init(url: URL.init(string: ConstantVariables.urlToGetAuthorization)!))
                self.hideLoading("Completed.")
                break
            case .failed(let message):
                "failed".createMessage(message: message)
                break
            }
        }
    }
}

extension DashboardViewController {
    
    // route to webview
    func proccessRouteToWebView () {
        let destination = WebViewViewController.init(nibName: "WebViewViewController", bundle: nil)
        destination.webUrl = ConstantVariables.urlToGetAuthorization
        self.show(destination, sender: nil)
    }
    
    
    
    // initialize Modal
    private func initializeModal () -> UnsplashLoginCostumCredentialViewController {
        let unsplashDialog = UnsplashLoginCostumCredentialViewController.init(nibName: "UnsplashLoginCostumCredentialViewController", bundle: nil)
        unsplashDialog.modalPresentationStyle = .overCurrentContext
        unsplashDialog.delegate = self
        return unsplashDialog
    }
}

extension DashboardViewController : unsplashLoginActions {
    func understood() {
        self.proccessRouteToWebView()
    }
    
    func nope() {
    }
}
