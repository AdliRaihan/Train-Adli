//
//  AuthCompletion.swift
//  Training-Adli
//
//  Created by Adli Raihan on 26/09/19.
//  Copyright © 2019 Adli Raihan. All rights reserved.
//

import Foundation



class AuthCompletion {
    enum AuthorizationCredential {
        case success (response : String)
        case failed (message : String)
    }
    enum tokenCompletion {
        case success(response : unsplash.oauthTokenModel.tokenResponse)
        case failed (message : String)
    }
}
