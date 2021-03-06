//
//  ProfilePresenter.swift
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

protocol ProfilePresentationLogic
{
    func presentProfile(response : Profile.privateProfile.response)
    func presentPublicProfile (response : Profile.publicProfile.response)
}

class ProfilePresenter: ProfilePresentationLogic
{
    weak var viewController: ProfileDisplayLogic?
    
    // MARK: Do something
    func presentProfile(response: Profile.privateProfile.response) {
        var model : Profile.privateProfile.viewModel = Profile.privateProfile.viewModel.init()
        model.email = response.email ?? ""
        model.firstName = response.firstName ?? ""
        model.username = response.username ?? "<Unkown>"
        model.followers = response.followers ?? 0
        model.imageURL = response.imageURL?._large ?? ""
        viewController?.displayToProfile(viewModel: model)
    }
    
    func presentPublicProfile(response: Profile.publicProfile.response) {
        viewController?.displayToPublicProfile(response: response)
    }
}

