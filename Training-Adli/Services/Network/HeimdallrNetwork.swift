//
//  HeimdallrNetwork.swift
//  Training-Adli
//
//  Created by Adli Raihan on 20/09/19.
//  Copyright © 2019 Adli Raihan. All rights reserved.
//

import Foundation
import Heimdallr


public class HeimdallrNetwork {
    
    public static let shared : HeimdallrNetwork = {
        return HeimdallrNetwork()
    }()
    
    public var credentials: OAuthClientCredentials = {
        return OAuthClientCredentials(id: ConstantVariables.clientId)
    }()
    
    func GetTokenAccess () {
        let heimdallr = Heimdallr.init(tokenURL: URL.init(string: ConstantVariables.baseURLAuth)!)
    }
    
}
