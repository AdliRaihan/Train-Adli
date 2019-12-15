//
//  DashboardImages.swift
//  Training-Adli
//
//  Created by Stella Patricia on 16/10/19.
//  Copyright © 2019 Adli Raihan. All rights reserved.
//

import Foundation
import Realm
import RealmSwift
import RxSwift

class DashboardImages : Object
{
    
    @objc dynamic var id : String!
    @objc dynamic var username : String!
    @objc dynamic var image : String!
    @objc dynamic var liked : String!
    
    override class func primaryKey () -> String? {
        return "id"
    }
    
}
