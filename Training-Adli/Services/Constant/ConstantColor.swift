//
//  ConstantColor.swift
//  Training-Adli
//
//  Created by Stella Patricia on 27/09/19.
//  Copyright © 2019 Adli Raihan. All rights reserved.
//

import Foundation
import UIKit

class ConstantColor {
    
    class colorPrimaryScheme {
        let PrimaryRed = 0xca3e47
        let PrimaryDark  = 0x525252
        let PrimaryLight = 0x414141
        let PrimaryDarkFlat  = 0x313131
        
        enum colorPalletes {
            case red
            case primaryDark
            case primaryLight
            case primaryDarkFlat
        }
        
        func getPalletes (colorScheme _selected : colorPalletes) -> UIColor {
            switch _selected {
            case .red:
                return UIColor.init(rgb: PrimaryRed)
            case .primaryDark:
                return UIColor.init(rgb: PrimaryDark)
            case .primaryLight:
                return UIColor.init(rgb: PrimaryLight)
            case .primaryDarkFlat:
                return UIColor.init(rgb: PrimaryDarkFlat)
            }
        }
    }
    
}
