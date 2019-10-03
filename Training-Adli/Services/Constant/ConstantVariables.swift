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
    static var urlToGetAuthorization = "https://unsplash.com/oauth/authorize?client_id=158e22d2be6cab776308c3250270a395cc2813ca8346c59643b949a4c68ae513&redirect_uri=urn%3Aietf%3Awg%3Aoauth%3A2.0%3Aoob&response_type=code&scope=public+read_user"
    
    static var clientId         = "158e22d2be6cab776308c3250270a395cc2813ca8346c59643b949a4c68ae513"
    static var clientIdKey      = "client_id"
    static var secretKey        = "55c7dc2458c517c02b2797f92f9707f1195e28cf10ab18cb1bf6c238932fc7c3"
    static var secretKeyKey     = "client_secret"
    static var redirectUrl      = "urn:ietf:wg:oauth:2.0:oob"
    static var redirectUrlKey   = "redirect_uri"
    static var scope            = "public+read_user"
    static var scopeKey         = "scope"
    static var responseType     = "bearer"
    static var responseTypeKey  = "response_type"
    static var accessToken      = Defaults[.userAuthenticationCode]
}


/*
 https://unsplash.com/oauth/authorize?
 client_id=158e22d2be6cab776308c3250270a395cc2813ca8346c59643b949a4c68ae513&
 redirect_uri=urn%3Aietf%3Awg%3Aoauth%3A2.0%3Aoob&
 response_type=code&
 scope=public+read_user
 */
