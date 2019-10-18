//
//  ViewExtension.swift
//  Training-Adli
//
//  Created by Adli Raihan on 11/09/19.
//  Copyright © 2019 Adli Raihan. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    // Make curve from view
    func constantRadius (withBorder : Bool = false) {
        layer.cornerRadius = 5
        
        if withBorder {
            layer.borderColor = UIColor.gray.cgColor.copy(alpha: 0.25)
            layer.borderWidth = 1
        }
    }
    
    // circle (____)
    func circleRadius (withBorder : Bool = false) {
        layer.cornerRadius = frame.height / 2
        if withBorder {
            layer.borderColor = UIColor.gray.cgColor.copy(alpha: 0.25)
            layer.borderWidth = 1
        }
    }
    
    // default shadows
    func setShadow (withColor color : UIColor = .black,Opacity opacity : Float = 0.1) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = .zero
        layer.shadowRadius = 5
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
    }
    
    
    // Round Something currently not use since this code has a bug
    func roundSomething ( corner : UIRectCorner , radius : CGFloat ) {
        let path = UIBezierPath.init(roundedRect: CGRect.init(x: 0, y: 0, width: bounds.width, height: bounds.height), byRoundingCorners: corner, cornerRadii: CGSize.init(width: radius, height: radius))
        let mask = CAShapeLayer()
        "UIVIEW".createMessage(message: "\(frame)")
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    
    func changeColorPrimary (_color : ConstantColor.colorPrimaryScheme.colorPalletes) {
        backgroundColor = ConstantColor.colorPrimaryScheme().getPalletes(colorScheme: _color)
    }
}
