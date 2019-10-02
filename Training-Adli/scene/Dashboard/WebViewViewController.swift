//
//  WebViewViewController.swift
//  Training-Adli
//
//  Created by Adli Raihan on 27/09/19.
//  Copyright © 2019 Adli Raihan. All rights reserved.
//

import UIKit
import WebKit
import SwiftyUserDefaults

class WebViewViewController: BaseViewController {
    
    struct userInformations {
        var codeAuthorization : String = ""
    }
    
    // Outlet marker
    @IBOutlet weak var addressBarView: UIView!
    @IBOutlet weak var addressBarTextField: UITextField!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    @IBOutlet weak var addressBarTextFieldConstraint: NSLayoutConstraint!
    
    // website variable
    var webUrl : String = ""
    /* UserInformation */
    var userInfo : userInformations = userInformations()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTitle(Title: "Authorization")
        setupWebView()
        setupObserver()
    }
    
    private func setupBar (completion : @escaping (String) -> Void) {
        self.addressBarView.setShadow()
        self.addressBarView.changeColorPrimary(_color: .primaryDarkFlat)
        self.addressBarTextField.isEnabled = false
        self.addressBarTextField.changeColorPrimary(_color: .primaryLight)
        self.addressBarTextField.text = webUrl
        completion(webUrl)
    }
    
    private func setupWebView () {
        self.webView.navigationDelegate = self
        self.webView.clearCache()
        setupBar { (url) in
            self.webView.scrollView.bounces = false
            self.webView.load(URLRequest.init(url: URL.init(string: url)!))
        }
    }
    
    
    private func setupObserver () {
        self.webView.addObserver(self, forKeyPath: "URL", options: .new, context: nil)
        self.webView.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == #keyPath(WKWebView.url) {
            let url = self.webView.url!
            if let safeUrl = url.query , safeUrl.contains("code=") {
                finishPage()
                self.showLoading("This Might Take Long...")
                self.userInfo.codeAuthorization = safeUrl.replacingOccurrences(of: "code=", with: "")
                createAuthorization()
            } else { return }
        }
    }
    
    private func extendsAddressBar () {
        self.addressBarTextFieldConstraint.constant = 60
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
            self.indicatorView.alpha = 1
        }
    }
    private func shrinkAddressBar () {
        self.addressBarTextFieldConstraint.constant = 10
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
            self.indicatorView.alpha = 0
        }
    }
    private func loadPage () {
        extendsAddressBar()
        indicatorView.startAnimating()
    }
    private func finishPage () {
        shrinkAddressBar()
        indicatorView.stopAnimating()
    }
    
    
    private func createAuthorization () {
        let request = unsplash.oauthTokenModel.tokenRequest()
        request.clientId = ConstantVariables.clientId
        request.scope = ConstantVariables.scope
        request.redirectUrl = ConstantVariables.redirectUrl
        request.secretKey = ConstantVariables.secretKey
        request.code = self.userInfo.codeAuthorization
        AuthWorker().getToken(request) { (result) in
            switch result {
                
            case .success(let response):
                Defaults[.userAuthenticationCode] = response.accessToken
                self.hideLoading("")
                self.motionDismissViewController()
                break
            case .failed(let message):
                self.showAlert(_message: message)
                break
            }
            
            
        }
    }
    
}

extension WebViewViewController : WKNavigationDelegate {
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        self.loadPage()
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.finishPage()
    }
}
