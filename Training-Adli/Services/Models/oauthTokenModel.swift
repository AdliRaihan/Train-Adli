//
//  oauthTokenModel.swift
//  Training-Adli
//
//  Created by Adli Raihan on 20/09/19.
//  Copyright © 2019 Adli Raihan. All rights reserved.
//

import Foundation
import ObjectMapper

extension unsplash {
    class oauthTokenModel {
        
        class func createParams ( param : tokenRequest ) -> [String:Any] {
            "Parameters".createMessage(message: "\(param)")
            let const = ConstantVariables.self
            return [const.clientIdKey       :param.clientId,
                    const.secretKeyKey      :param.secretKey,
                    const.redirectUrlKey    :param.redirectUrl,
                    "code"                  :param.code,
                    "grant_type"            :"authorization_code"]
        }
        
        class tokenRequest : Mappable {
            
            var clientId : String = ""
            var redirectUrl : String = ""
            var scope : String = ""
            var code : String = ""
            var secretKey : String = ""
            var grantType : String = "authorization_code"
            
            init() {
                
            }
            
            required init?(map: Map) {
            }
            
            func mapping(map: Map) {
                clientId        <- map["client_id"]
                redirectUrl     <- map["redirect_uri"]
                scope           <- map["scope"]
                code            <- map["code"]
                grantType       <- map["grant_type"]
                secretKey       <- map["secret_key"]
            }
        }
        
        class tokenResponse : Mappable {
            
            var accessToken : String = ""
            var tokenType : String = ""
            var scope : String = ""
            var createdAt : String = ""
            
            
            required init?(map: Map) {
            }
            
            func mapping(map: Map) {
                accessToken     <- map["access_token"]
                tokenType       <- map["token_type"]
                scope           <- map["scope"]
                createdAt       <- map["created_at"]
            }
        }
    }
}
