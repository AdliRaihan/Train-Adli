//
//  CoreDataModel.swift
//  Training-Adli
//
//  Created by Stella Patricia on 11/09/19.
//  Copyright © 2019 Adli Raihan. All rights reserved.
//

import Foundation

enum cModelFor {
    struct Entity {
        var uid : Int = -1
        var username : String = ""
        var email : String = ""
    }
    struct  EntityKey {
        let uid : String = "uid"
        var username : String = "username"
        var email : String = "email"
    }
}
