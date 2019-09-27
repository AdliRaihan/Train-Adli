//
//  WebViewViewController.swift
//  Training-Adli
//
//  Created by Stella Patricia on 27/09/19.
//  Copyright © 2019 Adli Raihan. All rights reserved.
//

import UIKit
import WebKit

class WebViewViewController: BaseViewController {
    
    // Outlet marker
    @IBOutlet weak var addressBarView: UIView!
    @IBOutlet weak var addressBarTextField: UITextField!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    @IBOutlet weak var addressBarTextFieldConstraint: NSLayoutConstraint!
    
    // website variable
    var webUrl : String = ""
    
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
//                self.userInfo.codeAuthorization = safeUrl.replacingOccurrences(of: "code=", with: "")
//                createAuthorization()
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
    
}

extension WebViewViewController : WKNavigationDelegate {
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        self.loadPage()
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.finishPage()
    }
}
