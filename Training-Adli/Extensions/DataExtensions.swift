//
//  DataExtensions.swift
//  Training-Adli
//
//  Created by Adli Raihan on 20/09/19.
//  Copyright © 2019 Adli Raihan. All rights reserved.
//

import Foundation


extension Data {
    var computeData : [String:Any] {
        guard let jsonObject  = try? JSONSerialization.jsonObject(with: self, options: []) as! [String:Any] else {
            return [:]
        }
        "Data".createMessage(message: "\(jsonObject)")
        return jsonObject
    }
    
}
