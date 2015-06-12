//
//  StatsBar.swift
//  StuffedAnimalMortalKombat
//
//  Created by Kyle Brooks Robinson on 6/12/15.
//  Copyright (c) 2015 Kyle Brooks Robinson. All rights reserved.
//

import UIKit

@IBDesignable class StatsBar: UIView {
    
    @IBInspectable var points: CGFloat = 90 {
        
        didSet { setNeedsDisplay() }
        
    }
    
    
    @IBInspectable var fullColor: UIColor = UIColor.greenColor()
    @IBInspectable var lightColor: UIColor = UIColor.blueColor()
    
    override func drawRect(rect: CGRect) {
        
        let context = UIGraphicsGetCurrentContext()
        
        lightColor.set()
        
        let fullPath = UIBezierPath(roundedRect: rect, cornerRadius: rect.height / 2)
        
        CGContextAddPath(context, fullPath.CGPath)
        CGContextFillPath(context)
        
        fullColor.set()
        
        let pointsWidth = points / 100 * rect.width
        let pointsRect = CGRectMake(0, 0, pointsWidth, rect.height)
        
        let pointsPath = UIBezierPath(roundedRect: pointsRect, cornerRadius: rect.height / 2)
        
        CGContextAddPath(context, pointsPath.CGPath)
        CGContextFillPath(context)
        
        
    }
    
}