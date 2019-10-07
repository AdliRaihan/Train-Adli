//
//  ConstantDefaults.swift
//  Training-Adli
//
//  Created by Adli Raihan on 27/09/19.
//  Copyright © 2019 Adli Raihan. All rights reserved.
//

import Foundation
import SwiftyUserDefaults

extension DefaultsKeys {
    
    static var userAuthenticationCode : DefaultsKey<String> { return .init("authenticationcode",defaultValue: "")}
    
    class func removeCredentials () {
        Defaults[.userAuthenticationCode] = ""
    }
}
