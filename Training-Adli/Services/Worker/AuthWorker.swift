//
//  AuthWorker.swift
//  Training-Adli
//
//  Created by Stella Patricia on 20/09/19.
//  Copyright © 2019 Adli Raihan. All rights reserved.
//

import Foundation
import ObjectMapper

enum localCompletion {
    case success (response : String)
}
enum tokenCompletion {
    case success()
}

class AuthWorker {
    func getAuth (_ localRequest : unsplash.AuthRequest,_ completion: @escaping (localCompletion) -> Void) {
        trainProvider.request(trainServices.oauth(request: localRequest)) { (result) in
            switch result {
            case .success(let success):
                
                "testing".createMessage(message: "\(trainServices.oauth(request: localRequest))")
                
                do {
                    let mapbaru = try success.mapJSON()
                    trainServices.oauth(request: localRequest).headers
                    "berhasil".createMessage(message: "\(mapbaru) \(String(describing: trainServices.oauth(request: localRequest).headers))")
                }
                catch {
                    "ggl".createMessage(message: "masihgagal")
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
                "ERR".createMessage(message: error.localizedDescription)
                break
            }
        }
    }
    
    func getToken (_ localRequest : unsplash.oauthTokenModel.tokenRequest,_ completion : @escaping (tokenCompletion) -> Void) {
        trainProvider.request(trainServices.oatuhAccessToken(request: localRequest)) { (result) in
            "Path".createMessage(message: "\(result)")
            switch result {
            case .success(let success):
                "Success".createMessage(message: "\(success)")
                do {
                    let map = try success.mapString()
                    "Success".createMessage(message: "\(map)")
                }
                catch {
                    "Unexception".createMessage(message: error.localizedDescription)
                }
                break
            case .failure(let error):
                "Failure".createMessage(message: error.localizedDescription)
                break
            }
            
        }
    }
}

/*
 https://unsplash.com/oauth/authorize?
        client_id=158e22d2be6cab776308c3250270a395cc2813ca8346c59643b949a4c68ae513&
        redirect_uri=urn%3Aietf%3Awg%3Aoauth%3A2.0%3Aoob&
        response_type=code&
        scope=public+read_user
 */
