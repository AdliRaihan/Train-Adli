//
//  NetworkManager.swift
//  Training-Adli
//
//  Created by Adli Raihan on 20/09/19.
//  Copyright © 2019 Adli Raihan. All rights reserved.
//

import Foundation
import SwiftyUserDefaults
import Moya

let authPlugin = AccessTokenPlugin.init(tokenClosure: Defaults[.userAuthenticationCode])
let trainProvider = MoyaProvider<trainServices>(plugins: [NetworkPlugins(),authPlugin])

enum trainServices {
    case oauth (request : unsplash.AuthRequest)
    case oatuhAccessToken (request : unsplash.oauthTokenModel.tokenRequest)
    case getPhotos (request : Dashboard.getPhotos.request)
    case getProfile ()
    
    // POST
    case setActionLike (request : Dashboard.likePhotos.request)
    
    // DELETE
    case setActionUnlike (request : Dashboard.likePhotos.request)
}


extension trainServices : TargetType , AccessTokenAuthorizable {
    var baseURL: URL {
        switch self {
        case .oatuhAccessToken: return URL.init(string: ConstantVariables.baseURL)!
        default : return URL.init(string: ConstantVariables.baseURLAuth)!
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .setActionUnlike: return .delete
        case .oatuhAccessToken,.setActionLike : return .post
        default: return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return NetworkTasks.createRequest(service: self)
    }

    var headers: [String : String]? {
        "Headers".createMessage(message: "\(NetworkHeader.header(self))")
        return NetworkHeader.header(self)
    }
    
    var path : String {
        return NetworkPath.createPath(self) ?? ""
    }
    
    var authorizationType: AuthorizationType {
        switch self {
        default: return .bearer
        }
    }
    
}
