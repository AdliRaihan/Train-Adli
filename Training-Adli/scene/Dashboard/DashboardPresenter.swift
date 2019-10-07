//
//  DashboardPresenter.swift
//  Training-Adli
//
//  Created by Stella Patricia on 03/10/19.
//  Copyright (c) 2019 Adli Raihan. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol DashboardPresentationLogic
{
    func presentToShowPhotos (response : [Dashboard.getPhotos.response])
    func presentToFailed (message : String)
}

class DashboardPresenter: DashboardPresentationLogic
{
    weak var viewController: DashboardDisplayLogic?
    
    // Show when success to load images
    func presentToShowPhotos(response: [Dashboard.getPhotos.response]) {
        var viewModel = Dashboard.getPhotos.viewModel.init()
        viewModel.responsePrimary = response
        viewController?.displayToShowPhotos(_response: viewModel)
    }
    
    // Show when failed to load images
    func presentToFailed(message: String) {
        viewController?.displayError(message: message)
    }
}


