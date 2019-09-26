//
//  LabelExtension.swift
//  Training-Adli
//
//  Created by Stella Patricia on 16/09/19.
//  Copyright © 2019 Adli Raihan. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    
    func textDropShadow(withColor color : UIColor) {
        layer.shadowColor = color.cgColor
        layer.masksToBounds = false
        layer.shadowRadius = 4.0
        layer.shadowOpacity = 1
        layer.shadowOffset = .zero
    }
    
}
