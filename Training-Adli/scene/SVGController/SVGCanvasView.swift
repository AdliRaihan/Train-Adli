//
//  SVGCanvasViewController.swift
//  Training-Adli
//
//  Created by Adli Raihan on 01/10/19.
//  Copyright © 2019 Adli Raihan. All rights reserved.
//

import UIKit

class SVGCanvasView: UIView {
    
    struct chartPoint  {
        var pointX : CGFloat = 0.0
        var pointY : CGFloat = 0.0
    }
    
    var titikGraph : [chartPoint] = []
    var targetGraph : [chartPoint] = []

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        self.setPath()
        let simPath = UIBezierPath.init()
        guard self == self else { return }
        
        for _ in 0..<self.targetGraph.count {
            
            simPath.move(to: CGPoint(x: -5, y: 157))
            simPath.addQuadCurve(to: CGPoint(x: self.frame.width / 2, y: 157),
                                 controlPoint: CGPoint(x: self.frame.width / 4, y: 95))
            simPath.addQuadCurve(to: CGPoint(x: self.frame.width , y: 157), controlPoint: CGPoint(x: (self.frame.width - (self.frame.width / 4)) , y: (157 + 62)))
            
        }
        
        simPath.lineWidth = 2
        UIColor.darkGray.set()
        simPath.stroke()
        setNeedsDisplay()
        
        "Draw".createMessage(message: "Success!")
    }
    
    private func setPath () {
        let originX = self.frame.origin.x
        let centerY = self.frame.height / 2
        
        titikGraph.append(SVGCanvasView.chartPoint.init(pointX: originX, pointY: centerY))
        targetGraph.append(SVGCanvasView.chartPoint.init(pointX: +50.0, pointY: centerY - 50))
        
        titikGraph.append(SVGCanvasView.chartPoint.init(pointX: +50.0, pointY: centerY - 50))
        targetGraph.append(SVGCanvasView.chartPoint.init(pointX: +100.0, pointY: centerY - 25))
        
        titikGraph.append(SVGCanvasView.chartPoint.init(pointX: +100.0, pointY: centerY - 25))
        targetGraph.append(SVGCanvasView.chartPoint.init(pointX: +150.0, pointY: centerY))
        
        titikGraph.append(SVGCanvasView.chartPoint.init(pointX: +150.0, pointY: centerY - 25))
        targetGraph.append(SVGCanvasView.chartPoint.init(pointX: +160.0, pointY: centerY))
        
    }
    
    

}

extension SVGCanvasView : Comparable {
    
    static func < (lhs: SVGCanvasView, rhs: SVGCanvasView) -> Bool {
        return lhs.targetGraph.count < rhs.titikGraph.count
    }
    
    static func == (lhs: SVGCanvasView, rhs: SVGCanvasView) -> Bool {
        "LHS".createMessage(message: "LHS Checking . . .")
        return (lhs.targetGraph.count == rhs.titikGraph.count)
    }
    
    
}
