//
//  NetworkPlugins.swift
//  Training-Adli
//
//  Created by Adli Raihan on 26/09/19.
//  Copyright © 2019 Adli Raihan. All rights reserved.
//

import Foundation
import Moya

class NetworkPlugins : PluginType {
    func willSend(_ request: RequestType, target: TargetType) {
        "Network Log's".createMessage(message: "\(String(describing: request)) \(String(describing: target))")
    }
}
