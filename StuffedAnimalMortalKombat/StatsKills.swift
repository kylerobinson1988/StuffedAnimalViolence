//
//  StatsKills.swift
//  StuffedAnimalMortalKombat
//
//  Created by Kyle Brooks Robinson on 6/12/15.
//  Copyright (c) 2015 Kyle Brooks Robinson. All rights reserved.
//

import UIKit

@IBDesignable class StatsKills: UIView {
    
    @IBInspectable var killCount: Int = 0 {
        
        didSet { setNeedsDisplay() }
        
    }
    
    @IBInspectable var padding: CGFloat = 3
    @IBInspectable var color: UIColor = UIColor.blackColor()
    @IBInspectable var killsPerLine: CGFloat = 10
    
    override func drawRect(rect: CGRect) {
        
        let context = UIGraphicsGetCurrentContext()
        
        color.set()
        
        let hw = (rect.width - ((killsPerLine - 1) * padding)) / killsPerLine
        
        for i in 0..<killCount {
            
            let x = (hw + padding) * (CGFloat(i) % killsPerLine)
            let y = (hw + padding) * floor(CGFloat(i) / killsPerLine)
            
            CGContextFillEllipseInRect(context, CGRectMake(x, y, hw, hw))
            
        }
        
        
        
        
    }
    
}