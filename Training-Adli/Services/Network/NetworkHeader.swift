//
//  NetworkHeader.swift
//  Training-Adli
//
//  Created by Adli Raihan on 26/09/19.
//  Copyright © 2019 Adli Raihan. All rights reserved.
//

import Foundation


class NetworkHeader {
    class func header (_ services : trainServices) -> [String:String] {
        switch services {
        case .oauth( _):
            return [:]
        case .oatuhAccessToken:
            
            return ["Accept" : "application/json"]
        }
    }
    
}
