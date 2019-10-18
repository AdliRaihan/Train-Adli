//
//  DashboardInteractor.swift
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
import ObjectMapper
import Moya
import RxSwift

protocol DashboardBusinessLogic
{
    func getOfflinePhotos ()
    func getAllPhotos(request : Dashboard.getPhotos.request)
    func saveAllPhotos(data : Dashboard.getPhotos.tableViewModel)
    func setLikedPhoto(_id : String)
    func setUnlikePhoto(_id : String)
}

protocol DashboardDataStore
{
    //var name: String { get set }
}

class DashboardInteractor: DashboardBusinessLogic, DashboardDataStore
{
    
    var presenter: DashboardPresentationLogic?
    var worker: DashboardWorker?
    
    
    // Get all Photos (Realm)
    func getOfflinePhotos() {
        let repo : DashboardRepository = DashboardRepositoryImpl()
        var repoPhotos : [DashboardImages] = []
        
        
        // insert data
        repo.getPhotos().asObservable().subscribe(onNext: { (data) in
            let repoPhoto = DashboardImages()
            repoPhoto.id = data.id
            repoPhoto.image = data.image
            repoPhoto.liked = data.liked
            repoPhoto.username = data.username
            repoPhotos.append(repoPhoto)
        }, onError: { (error) in
            fatalError(error.localizedDescription)
        }, onCompleted: {
            self.presenter?.presentToShowOfflinePhotos(model: repoPhotos)
        }).disposed(by: DisposeBag())
        
        // debug
        "interactor".createMessage(message: "Through This")
    }
    
    // Get All Photos (API)
    func getAllPhotos(request : Dashboard.getPhotos.request) {
        DashboardWorker().getAllPhotos(request: request) { (result) in
            switch result {
            case .success(let data):
                do {
                    " Message Response ".createMessage(message: try data.mapString())
                    guard let mapArray : [NSDictionary] = try data.mapArrayJSON() as? [NSDictionary] else { return }
                    var mapResult : [Dashboard.getPhotos.response] = []
                    guard mapArray.count > 0 else { return }
                    " Actual Response ".createMessage(message: mapArray)
                    for ValueArray in mapArray {
                        if let valueNested = ValueArray as? [String:Any] {
                            mapResult.append(Mapper<Dashboard.getPhotos.response>().map(JSON: valueNested)!)
                        }
                    }
                    self.presenter?.presentToShowPhotos(response: mapResult)
                } catch (let error ) {
                    self.presenter?.presentToFailed(message: error.localizedDescription)
                }
                break
            case .error(let error):
                self.presenter?.presentToFailed(message: error)
                break
            }
        }
    }
    
    // When user liked a photo
    func setLikedPhoto(_id : String) {
        "Liked Photos Task".createMessage(message: "Successfully!")
        let request = Dashboard.likePhotos.request()
        request.id = _id
        DashboardWorker.init().setLikePhotos(request: request) { (result) in
            switch result {
            case .success(let data):
                do {
                    "Message".createMessage(message: try data.mapString())
                } catch (let error) {
                    self.presenter?.presentToFailed(message: error.localizedDescription)
                }
                break
            case .error(let error):
                self.presenter?.presentToFailed(message: error)
                break
            }
        }
    }
    
    // Action when user unliked the photo
    func setUnlikePhoto(_id: String) {
        let request = Dashboard.likePhotos.request()
        request.id = _id
        DashboardWorker.init().setUnlikePhotos(request: request) { (result) in
            switch result {
            case .success(let data):
                do {
                    "Message".createMessage(message: try data.mapString())
                } catch (let error) {
                    self.presenter?.presentToFailed(message: error.localizedDescription)
                }
                break
            case .error(let error):
                self.presenter?.presentToFailed(message: error)
                break
            }
        }
    }
    
    
    // Action when .... ( Fill in the blank )
    func saveAllPhotos(data: Dashboard.getPhotos.tableViewModel) {
        let repository : DashboardRepository = DashboardRepositoryImpl()
        
        // Read before its return his functions
        repository.getPhotos().asObservable().subscribe(onNext: { (_dataModel) in
            "Current Repository".createMessage(message: _dataModel)
        }).dispose()
        
        // Delete all available data when its updated
        // Why i Do This because I dont want to have too many stacked data
        repository.deleteAll().asObservable().subscribe(onCompleted: {
            "Delete Status".createMessage(message: "Success!")
        }, onDisposed: {
            "Disposed Status".createMessage(message: "Memory Deallocated!")
        }).disposed(by: DisposeBag())
        
        // Insert The Data
        for index in 0..<data.descriptionsImage.count {
            if index == 10 { return }
            let dataModel : DashboardImages = DashboardImages()
            
            dataModel.id = data.idsPhoto[index]
            dataModel.image = data.modelImages[index]
            dataModel.liked = "\(data.likedByUser[index])"
            dataModel.username = data.username[index]
    
            repository.savePhotos(data: dataModel).asObservable().subscribe(onCompleted: {
                "Save Status".createMessage(message: "Success!")
            }) {
                "Dispose Status".createMessage(message: "Garbage disposed!")
            }.disposed(by: DisposeBag())
            
        }
        
    }
}

