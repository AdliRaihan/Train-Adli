//
//  ConstantVariables.swift
//  Training-Adli
//
//  Created by Adli Raihan on 20/09/19.
//  Copyright © 2019 Adli Raihan. All rights reserved.
//

import Foundation
import SwiftyUserDefaults


class ConstantVariables {
    
    static var get = ConstantVariables()
    static var baseURL = "https://unsplash.com/"
    static var baseURLAuth = "https://api.unsplash.com/"
    static var urlToGetAuthorization = "https://unsplash.com/oauth/authorize?client_id=158e22d2be6cab776308c3250270a395cc2813ca8346c59643b949a4c68ae513&redirect_uri=urn%3Aietf%3Awg%3Aoauth%3A2.0%3Aoob&response_type=code&scope=public+read_user+write_user+read_photos+write_photos+write_likes+write_followers+read_collections+write_collections"
    
    static var clientId         = /* change this */ "adli gantenk"
    static var clientIdKey      = "client_id"
    static var secretKey        = /* change this */ "read api.unsplash.com for setup the environtmen"
    static var secretKeyKey     = "client_secret"
    static var redirectUrl      = ""
    static var redirectUrlKey   = "redirect_uri"
    static var scope            = "public+read_user"
    static var scopeKey         = "scope"
    static var responseType     = "bearer"
    static var responseTypeKey  = "response_type"
    static var accessToken      = Defaults[.userAuthenticationCode]
}
