//
//  NetworkTasks.swift
//  Training-Adli
//
//  Created by Adli Raihan on 20/09/19.
//  Copyright © 2019 Adli Raihan. All rights reserved.
//

import Foundation
import Moya

class NetworkTasks {
    class func createRequest (service : trainServices ) -> Task {
        switch service {
            
            // Set Code authoreization
        case .oauth(let request):
            return .requestParameters(parameters: unsplash.createParams(param: request), encoding: URLEncoding.default)
            
            // Set User Authorization bearer
        case .oatuhAccessToken(let request):
            return .requestParameters(parameters: unsplash.oauthTokenModel.createParams(param: request), encoding: URLEncoding.default)
            
            // Get User Profile Information
        case .getProfile():
            return .requestParameters(parameters: [:], encoding: URLEncoding.default)
            
            // Get Photos
        case .getPhotos(let request):
            return .requestParameters(parameters: Dashboard.getPhotos.createParam(request: request), encoding: URLEncoding.default)
            
            // set Like Action
        case .setActionLike(let request):
            return .requestParameters(parameters: Dashboard.likePhotos.createParams(request: request), encoding: URLEncoding.default)
            
            // set Unlike Action
        case .setActionUnlike(let request):
            return .requestParameters(parameters: Dashboard.likePhotos.createParams(request: request), encoding: URLEncoding.default)
        }
    
    }
}
