//
//  ColorExtension.swift
//  Training-Adli
//
//  Created by Adli Raihan on 11/09/19.
//  Copyright © 2019 Adli Raihan. All rights reserved.
//

import Foundation
import Material
import UIKit

extension UIColor {
    
    
    private func colorFormat (_string :String) -> Int {
        if let color = Int(_string.replacingOccurrences(of: "#", with: "")) {
            return color
        }
        fatalError("Invalid format color hexa!")
    }
    
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
    
    func gradientAtDashboard () -> CAGradientLayer? {
        let gradientLayer : CAGradientLayer = CAGradientLayer()
        let topColor = UIColor.init(rgb: 0x484848).withAlphaComponent(0)
        let bottomColor = UIColor.init(rgb: 0x484848).withAlphaComponent(1)
        
        gradientLayer.colors = [topColor.cgColor,bottomColor.cgColor]
        return gradientLayer
    }
    
}
