//
//  LoginWebView.swift
//  Training-Adli
//
//  Created by Stella Patricia on 03/10/19.
//  Copyright © 2019 Adli Raihan. All rights reserved.
//

import UIKit
import WebKit

protocol loginWebViewDelegate {
    func didFinish(authCode value : String)
    func didCommit(url : String)
}

class LoginWebView: WKWebView , WKNavigationDelegate {
    var delegate : loginWebViewDelegate?
    
    // Awake from nib for delegate
    override func awakeFromNib() {
        super.awakeFromNib()
        self.navigationDelegate = self
    }
    // when webview is already load from url
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        let url = webView.url!
        "URLQuery".createMessage(message: url)
        if let _url = url.query , _url.contains("code=") {
            self.delegate?.didFinish(authCode: _url.replacingOccurrences(of: "code=", with: ""))
        } else {
            self.delegate?.didFinish(authCode: "")
        }
    }
    // When webView is load from url
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        self.delegate?.didCommit(url: webView.url?.absoluteString ?? "")
    }
}
