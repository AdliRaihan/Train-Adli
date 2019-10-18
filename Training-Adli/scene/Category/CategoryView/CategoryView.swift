//
//  CategoryView.swift
//  Training-Adli
//
//  Created by Stella Patricia on 09/10/19.
//  Copyright © 2019 Adli Raihan. All rights reserved.
//

import UIKit

class CategoryView: UIView {
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        let path = UIBezierPath.init()
        let baseX = self.frame.origin.x
        let baseY = self.frame.origin.y
        
        let midLeft = baseX + (self.frame.height / 2)
        
        
        let strecthPath = UIBezierPath.init() // buat potong ceritanya mah bray
        
        path.move(to: CGPoint.init(x: 0, y: 0))
        
        path.addLine(to: CGPoint.init(x: midLeft, y: self.frame.height / 2))
        path.addLine(to: CGPoint.init(x: 0, y: self.frame.height))
        path.addLine(to: CGPoint.init(x: self.frame.width, y: self.frame.height))
        path.addLine(to: CGPoint.init(x: self.frame.width - (midLeft), y: midLeft))
        path.addLine(to: CGPoint.init(x: self.frame.width, y: 0))
        path.addLine(to: CGPoint.init(x: 0, y: 0))
        
        UIColor.white.set()
        path.fill()
        path.lineWidth = 0
        
        
        
        strecthPath.move(to: CGPoint.init(x: midLeft, y: self.frame.height / 2))
        strecthPath.addLine(to: CGPoint.init(x: self.frame.width - (midLeft), y: midLeft))
        strecthPath.lineWidth = 1
        strecthPath.setLineDash([4.0,8.0], count: 2, phase: 0.0)
        strecthPath.lineJoinStyle = .round
        UIColor.darkGray.set()
        strecthPath.stroke()
        
        setNeedsLayout()
    }

}
