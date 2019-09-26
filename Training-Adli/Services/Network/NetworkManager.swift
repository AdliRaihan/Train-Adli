//
//  NetworkManager.swift
//  Training-Adli
//
//  Created by Adli Raihan on 20/09/19.
//  Copyright © 2019 Adli Raihan. All rights reserved.
//

import Foundation
import Moya

let trainProvider = MoyaProvider<trainServices>(plugins: [NetworkPlugins()])

enum trainServices {
    case oauth (request : unsplash.AuthRequest)
    case oatuhAccessToken (request : unsplash.oauthTokenModel.tokenRequest)
}


extension trainServices : TargetType {
    var baseURL: URL {
        return URL.init(string: ConstantVariables.baseURLAuth)!
    }
    
    var method: Moya.Method {
        switch self {
        case .oatuhAccessToken : return .post
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
        "Belegug".createMessage(message: "\(NetworkHeader.header(self))")
        return NetworkHeader.header(self)
    }
    
    var path : String {
        return NetworkPath.createPath(self) ?? ""
    }
    
}
