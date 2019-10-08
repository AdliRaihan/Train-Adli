//
//  SVGCanvasViewController.swift
//  Training-Adli
//
//  Created by Adli Raihan on 01/10/19.
//  Copyright © 2019 Adli Raihan. All rights reserved.
//

import UIKit
import SwiftyUserDefaults

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
        guard self == self else { return }
        
        let simPath = linedPath()
        let layerShapeHolder = CAShapeLayer()
        let IMAGE_ = UIImageView.init()
        let viewDark_ = UIView.init()
        
        IMAGE_.frame = CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 220)
        IMAGE_.kf.setImage(with: URL.init(string: Defaults[.appDefaultImageHeader]))
        viewDark_.frame = IMAGE_.frame
        viewDark_.backgroundColor = UIColor.darkGray.withAlphaComponent(0.1)
        
        simPath.close()
        layerShapeHolder.path = simPath.cgPath
        let boy = UIColor().gradientAtDashboard()
        boy?.frame = CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 220)
        boy?.mask = layerShapeHolder
        
        IMAGE_.contentMode = .scaleAspectFill
        IMAGE_.clipsToBounds = true
        IMAGE_.layer.mask = layerShapeHolder
        IMAGE_.layer.addSublayer(boy!)
        IMAGE_.addSubview(viewDark_)
        self.addSubview(IMAGE_)
        
        "Draw".createMessage(message: "Success!")
    }
    
    private func getPath (yCenter : CGFloat = 210 , curveValue :CGFloat = 40) -> UIBezierPath {
        
        let simPath = UIBezierPath.init()
        
        simPath.move(to: CGPoint(x: 0, y: yCenter))
        simPath.addQuadCurve(to: CGPoint(x: self.frame.width / 2, y: yCenter),
                             controlPoint: CGPoint(x: self.frame.width / 4, y: (yCenter - curveValue)))
        simPath.addQuadCurve(to: CGPoint(x: self.frame.width , y: yCenter), controlPoint: CGPoint(x: (self.frame.width - (self.frame.width / 4)) , y: (yCenter + curveValue)))
        
        simPath.addLine(to: CGPoint.init(x: self.frame.width , y: 0))
        simPath.addLine(to: CGPoint.init(x: 0, y: 0))
        simPath.addLine(to: CGPoint.init(x: 0, y: yCenter))
        return simPath
    }
    
    private func linedPath () -> UIBezierPath {
        let yCenter : CGFloat = 170
        let simPath = UIBezierPath.init()
        simPath.move(to: CGPoint(x: 0, y: yCenter))
        simPath.addLine(to: CGPoint.init(x: self.frame.width, y: yCenter + 50))
        simPath.addLine(to: CGPoint.init(x: self.frame.width, y: 0))
        simPath.addLine(to: CGPoint.init(x: 0, y: 0))
        simPath.addLine(to: CGPoint.init(x: 0, y: yCenter))
        return simPath
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
