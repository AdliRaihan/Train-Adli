//
//  MoyaExtension.swift
//  Training-Adli
//
//  Created by Stella Patricia on 03/10/19.
//  Copyright © 2019 Adli Raihan. All rights reserved.
//

import Foundation
import Moya

extension (Response) {
    func mapArrayJSON () throws -> Any {
        do {
            return try JSONSerialization.jsonObject(with: self.data, options: .allowFragments)
        } catch {
            throw MoyaError.jsonMapping(self)
        }
    }
    
    
    
}

extension NSDictionary {
    
    func getDictionary () {
        for (value,key) in self {
            "Value".createMessage(message: value)
        }
    }
}

