//
//  ProfileInteractor.swift
//  Training-Adli
//
//  Created by Adli Raihan on 02/10/19.
//  Copyright (c) 2019 Adli Raihan. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import ObjectMapper

protocol ProfileBusinessLogic
{
    func getProfile()
    func getPublicProfile(request : Profile.publicProfile.request)
}

protocol ProfileDataStore
{
    //var name: String { get set }
}

class ProfileInteractor: ProfileBusinessLogic, ProfileDataStore
{
    var presenter: ProfilePresentationLogic?
    var worker: ProfileWorker?
    //var name: String = ""
    
    func getProfile() {
        ProfileWorker().getProfileUser { (data) in
            switch data {
            case .success(let data):
                do {
                    let map = Mapper<Profile.privateProfile.response>().map(JSON: try data.mapJSON() as! [String:Any])
                    "SuccessLogs".createMessage(message: try data.mapJSON())
                    if map == nil {
                        
                    } else {
                        "Map _ Success".createMessage(message: map!)
                        self.presenter?.presentProfile(response: map!)
                    }
                }
                catch ( let error ) {
                    "Map _ Failed".createMessage(message: error.localizedDescription)
                }
                break
            case .error(let error):
                "Map _ Failed".createMessage(message: error)
                break
            }
        }
    }
    
    
    func getPublicProfile(request: Profile.publicProfile.request) {
        
        ProfileWorker().getPublicProfileUser(request: request) { (data) in
            // todo later:
            switch data {
            case .success(let data):
                do {
                    let map = Mapper<Profile.publicProfile.response>().map(JSON: try data.mapJSON() as! [String:Any])
                    "SuccessLogs".createMessage(message: try data.mapJSON())
                    if map == nil {
                        
                    } else {
                        "Map _ Success".createMessage(message: map!)
                        self.presenter?.presentPublicProfile(response: map!)
                    }
                }
                catch ( let error ) {
                    "Map _ Failed".createMessage(message: error.localizedDescription)
                }
                break
            case .error(let error):
                "Map _ Failed".createMessage(message: error)
                break
            }
        }
        
    }
    
    
}

