//
//  StatusView.swift
//  StuffedAnimalMortalKombat
//
//  Created by Kyle Brooks Robinson on 6/11/15.
//  Copyright (c) 2015 Kyle Brooks Robinson. All rights reserved.
//

import UIKit

@IBDesignable class StatusView: UIView {
    
  

}

class StatusBars: UIView {
    
    @IBInspectable var energyPoints: CGFloat = 90
    
    @IBInspectable var barColor: UIColor = UIColor.greenColor()
    
    @IBInspectable var lightBarColor: UIColor = UIColor.lightGrayColor()
    
    override func drawRect(rect: CGRect) {
        
        let context = UIGraphicsGetCurrentContext()
        
        let lineWidth: CGFloat = 5
        CGContextSetLineWidth(context, lineWidth)
        
        //Line width or bar width
        let barRect = CGRectInset(rect, lineWidth/2, lineWidth/2)
        
        //Line dot
//        addDotAtDegrees(-45, withColor: lightEnergy, andContext: context)
//        addDotAtDegrees(45, withColor: energyColor, andContext: context)
        
        CGContextSetBlendMode(context, kCGBlendModeSourceIn)
        let healthY = (1.0 - (healthPoints / 100)) * rect.height
        
        energyColor.set()
        
        CGContextMoveToPoint(context, x, y)
        CGContextAddLineToPoint(context, rect.width/2, rect.height/2)
        CGContextAddLineToPoint(context, 0, rect.height)
        CGContextFillPath(context)
        
    }
    
}
