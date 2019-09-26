//
//  ButtonExtension.swift
//  Training-Adli
//
//  Created by Adli Raihan on 11/09/19.
//  Copyright © 2019 Adli Raihan. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    
    enum stateButton {
        case active
        case normal
        case unavailable
    }
    
    func setStandardButton (state : stateButton = .normal) {
        self.layer.cornerRadius = 5
        
        switch state {
        case .active:
            
            self.backgroundColor = UIColor.orange.withAlphaComponent(0.2) ; break
        case .normal:
            
            self.backgroundColor = UIColor.orange.withAlphaComponent(0.2) ; break
        case .unavailable:
            
            self.backgroundColor = UIColor.orange.withAlphaComponent(0.2) ; break
        }
        
    }
    
}
