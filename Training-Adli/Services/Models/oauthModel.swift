//
//  oauthModel.swift
//  Training-Adli
//
//  Created by Stella Patricia on 20/09/19.
//  Copyright © 2019 Adli Raihan. All rights reserved.
//

import Foundation
import Moya
import ObjectMapper


class unsplash {
    
    class func createParams ( param : AuthRequest ) -> [String:Any] {
        "Parameters".createMessage(message: param.toJSONString(prettyPrint: true) ?? "")
        return ["": param.toJSONString(prettyPrint: true) ?? ""]
    }
    
    class AuthRequest : Mappable {
        
        
        var clientId : String = ""
        var redirectUrl : String = ""
        var responseType : String = ""
        var scope : String = ""
        
        init() {
        }
        
        required init?(map: Map) {
        }
        
        func mapping(map: Map) {
        }
        
    }
    
    class AuthResponse : Mappable {
        var htmlEncode : String = ""
        
        init () {
            
        }
        
        required init?(map: Map) {
        }
        
        func mapping(map: Map) {
            htmlEncode <- map
        }
    }
}
