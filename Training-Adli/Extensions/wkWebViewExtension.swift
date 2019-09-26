//
//  wkWebViewExtension.swift
//  Training-Adli
//
//  Created by Adli Raihan on 24/09/19.
//  Copyright © 2019 Adli Raihan. All rights reserved.
//

import Foundation
import WebKit


extension WKWebView {
    
    func clearCache () {
        let dataStore = WKWebsiteDataStore.default()
        dataStore.fetchDataRecords(ofTypes: WKWebsiteDataStore.allWebsiteDataTypes()) { (record) in
            dataStore.removeData(ofTypes: WKWebsiteDataStore.allWebsiteDataTypes(), for: record, completionHandler: {
                "Cache".createMessage(message: "Cleared!")
            })
        }
    }
}
