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
        
        for i in 0..<self.targetGraph.count {
            let CGPTitik = CGPoint.init(x: titikGraph[i].pointX, y: titikGraph[i].pointY)
            let CGPTarget = CGPoint.init(x: targetGraph[i].pointX, y: targetGraph[i].pointY)
            simPath.move(to: CGPTitik)
            simPath.addLine(to: CGPTarget)
        }
        
        simPath.lineWidth = 2
        simPath.close()
        UIColor.darkGray.set()
        simPath.stroke()
        simPath.fill()
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
