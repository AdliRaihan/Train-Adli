//
//  AuthWorker.swift
//  Training-Adli
//
//  Created by Adli Raihan on 20/09/19.
//  Copyright © 2019 Adli Raihan. All rights reserved.
//

import Foundation
import ObjectMapper

class AuthWorker {
    func getAuth (_ localRequest : unsplash.AuthRequest,_ completion: @escaping (AuthCompletion.AuthorizationCredential) -> Void) {
        trainProvider.request(trainServices.oauth(request: localRequest)) { (result) in
            switch result {
            case .success(let success):
                do {
                    let mapbaru = try success.mapJSON()
                    "Success".createMessage(message: "\(mapbaru) \(String(describing: trainServices.oauth(request: localRequest).headers))")
                }
                catch {
                    "Failed".createMessage(message: "Mapping Failed")
                }
                do {
                    let map = try success.mapString()
                    completion(.success(response:map))
                }
                catch {
                    "Unexception".createMessage(message: error.localizedDescription)
                }
                break
            case .failure(let error):
                "Error".createMessage(message: error.localizedDescription)
                break
            }
        }
    }
    
    func getToken (_ localRequest : unsplash.oauthTokenModel.tokenRequest,_ completion : @escaping (AuthCompletion.tokenCompletion) -> Void) {
        trainProvider.request(trainServices.oatuhAccessToken(request: localRequest)) { (result) in
            switch result {
            case .success(let success):
                "Success".createMessage(message: "\(success)")
                do {
                    let map = Mapper<unsplash.oauthTokenModel.tokenResponse>().map(JSON: try success.mapJSON() as! [String : Any])
                    "Success".createMessage(message: "\(String(describing: map?.toJSONString(prettyPrint: true)))")
                    
                    if map == nil {
                        completion(.failed(message: "Failed to Maping to response Object!"))
                    } else {
                        completion(.success(response: map!))
                    }
                    
                }
                catch {
                    "Unexception".createMessage(message: error.localizedDescription)
                }
                break
            case .failure(let error):
                "Error".createMessage(message: error.localizedDescription)
                break
            }
            
        }
    }
}
