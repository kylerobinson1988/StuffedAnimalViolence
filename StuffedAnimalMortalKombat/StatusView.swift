//
//  StatusView.swift
//  StuffedAnimalMortalKombat
//
//  Created by Kyle Brooks Robinson on 6/11/15.
//  Copyright (c) 2015 Kyle Brooks Robinson. All rights reserved.
//

import UIKit


@IBDesignable class StatusBars: UIView {
    
    @IBInspectable var energyPoints: CGFloat = 90
    @IBInspectable var barColor: UIColor = UIColor.greenColor()
    @IBInspectable var lightBarColor: UIColor = UIColor.blueColor()
    
    override func drawRect(rect: CGRect) {
        
        let context = UIGraphicsGetCurrentContext()
        let barRect = CGRectInset(rect, 1, 1)
        let path = UIBezierPath(roundedRect: barRect, cornerRadius: 10)
        
        let lineWidth: CGFloat = 5
        CGContextSetLineWidth(context, lineWidth)
        
        lightBarColor.set()
        CGContextAddPath(context, path.CGPath)
        CGContextFillPath(context)
        
        barColor.set()
        CGContextSetBlendMode(context, kCGBlendModeSourceIn)
        CGContextFillRect(context, CGRectMake(0, 0, rect.width - energyPoints, rect.height))
        CGContextFillPath(context)
        
    }
    
}


@IBDesignable class LivesDisplay: UIView {
    
    @IBInspectable var livesLeft: Int = 3 {
        
        didSet {
            
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var padding: CGFloat = 3
    
    override func drawRect(rect: CGRect) {
        
        backgroundColor = UIColor.clearColor()
        var context = UIGraphicsGetCurrentContext()
        
        var height = rect.height * 0.8
        var width = rect.height * 0.8
        
        for i in 0..<livesLeft {
            
            let x = CGFloat(i) * (width + padding)
            let y: CGFloat = 3
            
            UIColor.purpleColor().set()
            
            CGContextFillEllipseInRect(context, CGRectMake(x, y, width, height))
            
            
        }
    
    }


}

@IBDesignable class KillsDisplay: UIView {
    
    @IBInspectable var killCount: Int = 12 {
        
        didSet {
            
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var padding: CGFloat = 3
    
    override func drawRect(rect: CGRect) {
        
        backgroundColor = UIColor.clearColor()
        var context = UIGraphicsGetCurrentContext()
        
        var height = rect.height * 0.085
        var width = rect.height * 0.085
        if (killCount < 9) {
            
            for i in 0..<killCount {
                
                let x = CGFloat(i) * (width + padding)
                let y: CGFloat = 3
                
                UIColor.redColor().set()
                
                CGContextFillEllipseInRect(context, CGRectMake(x, y, width, height))
                
                
            }
            
        } else if (killCount > 9) {
                
                for i in 0..<(killCount - 8) {
                    
                    let x = CGFloat(i) * (width + padding)
                    let y: CGFloat = 5
                    
                    CGContextFillEllipseInRect(context, CGRectMake(x, y, width, height))
            
        }
        
        
    }
    
    
}

}