//
//  ControllerDecor.swift
//  StuffedAnimalMortalKombat
//
//  Created by Kyle Brooks Robinson on 6/9/15.
//  Copyright (c) 2015 Kyle Brooks Robinson. All rights reserved.
//

import UIKit

@IBDesignable class ControllerDecor: UIView {
    
    @IBInspectable var circleColor: UIColor = UIColor.blueColor()

    override func drawRect(rect: CGRect) {
        
        var path = UIBezierPath(ovalInRect: rect)
        circleColor.setFill()
        path.fill()
        
    }

}

@IBDesignable class touchPadCircle: UIView {
    
    @IBInspectable var lineThickness = 2.0
    @IBInspectable var circleColor: UIColor = UIColor.blackColor()
    
    override func drawRect(rect: CGRect) {
        
        var path = UIBezierPath(ovalInRect: rect)
        circleColor.setStroke()
        path.lineWidth = CGFloat(lineThickness)
        path.stroke()
        
        
    }
    
}

@IBDesignable class healthEnergyView: UIView {
    
    @IBInspectable var imageViewRadius: CGFloat = 15 {
        
        didSet {
            
            self.layer.cornerRadius = imageViewRadius
            self.layer.masksToBounds = true
        }
    }
    
}







