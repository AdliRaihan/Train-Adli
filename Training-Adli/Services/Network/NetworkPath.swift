//
//  NetworkPath.swift
//  Training-Adli
//
//  Created by Stella Patricia on 20/09/19.
//  Copyright © 2019 Adli Raihan. All rights reserved.
//

import Foundation

class NetworkPath {
    class func createPath (_ services : trainServices) -> String? {
        switch services {
        case .oauth:
            return "authorize"
        case .oatuhAccessToken:
            return "token"
        }
    }
}
