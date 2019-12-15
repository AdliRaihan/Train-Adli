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
    static var urlToGetAuthorization = "https://unsplash.com/oauth/"
    
    /* in case you dont know the logic 
     you need to impl url to get auth as webview then get the auth code to make request , after that you need to redirect / 
    make a route to dashboard , you dont need to set up anything else just get the url 
    */
    
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
