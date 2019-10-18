//
//  DashboardRepository.swift
//  Training-Adli
//
//  Created by Stella Patricia on 16/10/19.
//  Copyright © 2019 Adli Raihan. All rights reserved.
//

import Foundation
import RxSwift

protocol DashboardRepository {
    func savePhotos (data : DashboardImages) -> Completable
    func getPhotos () -> Observable<DashboardImages>
    func deleteAll () -> Completable
}
