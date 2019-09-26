//
//  ViewExtension.swift
//  Training-Adli
//
//  Created by Stella Patricia on 11/09/19.
//  Copyright © 2019 Adli Raihan. All rights reserved.
//

import Foundation
import UIKit


extension UIView {
    func constantRadius () {
        layer.cornerRadius = 5
    }
    
    func circleRadius () {
        layer.cornerRadius = frame.height / 2
    }
    
    func setShadow (withColor color : UIColor = .black,Opacity opacity : Float = 0.2) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = .zero
        layer.shadowRadius = 5
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
    }
    
    func roundSomething ( corner : UIRectCorner , radius : CGFloat ) {
        let path = UIBezierPath.init(roundedRect: CGRect.init(x: 0, y: 0, width: bounds.width, height: bounds.height), byRoundingCorners: corner, cornerRadii: CGSize.init(width: radius, height: radius))
        let mask = CAShapeLayer()
        "UIVIEW".createMessage(message: "\(frame)")
        mask.path = path.cgPath
        layer.mask = mask
    }
}
