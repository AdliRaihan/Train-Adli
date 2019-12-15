//
//  DashboardRepositoryImpl.swift
//  Training-Adli
//
//  Created by Stella Patricia on 17/10/19.
//  Copyright © 2019 Adli Raihan. All rights reserved.
//

import Foundation
import RealmSwift
import RxSwift


class DashboardRepositoryImpl : DashboardRepository {
    
    func savePhotos(data: DashboardImages) -> Completable {
        return Completable.create(subscribe: { (completable) -> Disposable in
            let realm = try! Realm()
            
            try! realm.write({
                realm.add(data, update: .all)
            })
            completable(.completed)
            
            return Disposables.create()
        })
    }
    
    func getPhotos() -> Observable<DashboardImages> {
        return Observable.create({ (observable) -> Disposable in
            // init action
            let realm = try! Realm()
            realm.refresh()
            let results = realm.objects(DashboardImages.self)
            
            // action
            for result in results {
                "Result Photos (GET)".createMessage(message: result)
                observable.onNext(result)
            }
            
            // after action
            observable.onCompleted()
            return Disposables.create()
        })
    }
    
    func deleteAll() -> Completable {
        return Completable.create(subscribe: { (completable) -> Disposable in
            // init action
            let realm = try! Realm()
            
            // Action
            try! realm.write {
                realm.delete(realm.objects(DashboardImages.self))
            }
            
            
            // after action
            completable(.completed)
            return Disposables.create()
        })
    }
    
}
