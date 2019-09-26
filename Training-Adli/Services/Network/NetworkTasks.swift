//
//  NetworkTasks.swift
//  Training-Adli
//
//  Created by Stella Patricia on 20/09/19.
//  Copyright © 2019 Adli Raihan. All rights reserved.
//

import Foundation
import Moya

class NetworkTasks {
    class func createRequest (service : trainServices ) -> Task {
        switch service {
        case .oauth(let request):
            return .requestParameters(parameters: unsplash.createParams(param: request), encoding: URLEncoding.default)
        case .oatuhAccessToken(let request):
            return .requestParameters(parameters: unsplash.oauthTokenModel.createParams(param: request), encoding: URLEncoding.default)
        }
    
    }
}
