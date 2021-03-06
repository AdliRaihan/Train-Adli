//
//  NetworkPath.swift
//  Training-Adli
//
//  Created by Adli Raihan on 20/09/19.
//  Copyright © 2019 Adli Raihan. All rights reserved.
//

import Foundation

class NetworkPath {
    class func createPath (_ services : trainServices) -> String? {
        switch services {
        case .oauth:
            return "oauth/authorize"
        case .oatuhAccessToken:
            return "oauth/token"
        case .getProfile():
            return "me"
        case .getPublicProfile(let request):
            return "users/\(request.username)"
        case .getPhotos:
            return "photos"
        case .setActionLike(let request):
            return "photos/\(request.id ?? "0" )/like"
        case .setActionUnlike(let request):
            return "photos/\(request.id ?? "0" )/like"
            
        }
    }
}
