//
//  CategorySpikeBill.swift
//  Training-Adli
//
//  Created by Stella Patricia on 09/10/19.
//  Copyright © 2019 Adli Raihan. All rights reserved.
//

import UIKit

class CategorySpikeBill: UIView {

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        let path = UIBezierPath.init()
        let maxHeight = self.frame.height
        let maxWidth = self.frame.width
        
        path.move(to: CGPoint.init(x: 0, y: 0))
        
        path.addLine(to: CGPoint.init(x: maxWidth / 2, y: maxHeight))
        path.addLine(to: CGPoint.init(x: maxWidth, y: 0))
        path.addLine(to: CGPoint.init(x: 0, y: 0))
        
        
        UIColor.white.set()
        path.fill()
        setNeedsLayout()
        self.backgroundColor = UIColor.white.withAlphaComponent(0)
    }

}
