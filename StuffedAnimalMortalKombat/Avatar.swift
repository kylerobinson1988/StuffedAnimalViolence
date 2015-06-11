//
//  Avatar.swift
//  StuffedAnimalMortalKombat
//
//  Created by Kyle Brooks Robinson on 6/10/15.
//  Copyright (c) 2015 Kyle Brooks Robinson. All rights reserved.
//

import UIKit

@IBDesignable class Avatar: UIView {

    @IBInspectable var healthPoints: CGFloat = 90
    @IBInspectable var energyPoints: CGFloat = 80
    
    @IBInspectable var healthColor: UIColor = UIColor.greenColor()
    @IBInspectable var energyColor: UIColor = UIColor.purpleColor()
    
    @IBInspectable var lightHealth: UIColor = UIColor.lightGrayColor()
    @IBInspectable var lightEnergy: UIColor = UIColor.lightGrayColor()
    
    
    override func drawRect(rect: CGRect) {
        
        let context = UIGraphicsGetCurrentContext()
        
        // Piece of paper
        let lineWidth: CGFloat = 10
        CGContextSetLineWidth(context, lineWidth)
        
        //Line width or bar width
        let barRect = CGRectInset(rect, lineWidth/2, lineWidth/2)
        
        
        
        //Left bar
        lightHealth.set()
        CGContextStrokeEllipseInRect(context, barRect)
        
        //Right bar
        CGContextSetBlendMode(context, kCGBlendModeSourceIn)
        energyColor.set()
        CGContextFillRect(context, CGRectMake(rect.width/2, 0, rect.width/2, rect.height))
        
        //Remove other parts of circle
        CGContextSetBlendMode(context, kCGBlendModeClear)
        CGContextMoveToPoint(context, 0, 0) //tl
        CGContextAddLineToPoint(context, rect.width, 0) //tr
        CGContextAddLineToPoint(context, rect.width / 2, rect.height / 2) //c
        CGContextAddLineToPoint(context, rect.width, rect.height)  //br
        CGContextAddLineToPoint(context, 0, rect.height)  //bl
        CGContextAddLineToPoint(context, rect.width / 2, rect.height / 2) //c
        CGContextFillPath(context)
        
        
        //Reset blend to normal
        CGContextSetBlendMode(context, kCGBlendModeNormal)
        
        //Add bar rounded ends
        addDotAtDegrees(-135, withColor: lightHealth, andContext: context)
        addDotAtDegrees(135, withColor: lightHealth, andContext: context)
        addDotAtDegrees(-45, withColor: lightEnergy, andContext: context)
        addDotAtDegrees(45, withColor: energyColor, andContext: context)
        
        //Add current health. 
        CGContextSetBlendMode(context, kCGBlendModeSourceIn)
        let healthY = (1.0 - (healthPoints / 100)) * rect.height
        
        healthColor.set()
        
        let degrees = Double(((healthPoints / 100) * 90) + 135)
        
        let angle = CGFloat(DegreesToRadians(degrees))
        
        let x = (rect.width/2) + (rect.width) * cos(angle)
        let y = (rect.width/2) + (rect.height) * sin(angle)
        
        CGContextMoveToPoint(context, x, y)
        CGContextAddLineToPoint(context, rect.width/2, rect.height/2)
        CGContextAddLineToPoint(context, 0, rect.height)
        CGContextFillPath(context)
        
        
        addDotAtDegrees(degrees, withColor: healthColor, andContext: context)
        addDotAtDegrees(135, withColor: healthColor, andContext: context)
        
        
        
        //Add current energy.
        CGContextSetBlendMode(context, kCGBlendModeSourceIn)


        let newEnergyY = (1.0 - (energyPoints / 100)) * rect.height
        
        lightEnergy.set()
        
        let energyDegrees = Double(45 - ((energyPoints / 100) * 90))
        
        let energyAngle = CGFloat(DegreesToRadians(energyDegrees))
        
        let energyX = (rect.width / 2) + (rect.width) * cos(energyAngle)
        let energyY = (rect.width / 2) + (rect.height) * sin(energyAngle)
        
        
        
        CGContextMoveToPoint(context, energyX, energyY)
        CGContextAddLineToPoint(context, rect.width/2, rect.height/2)
        CGContextAddLineToPoint(context, rect.height, 0)
        CGContextFillPath(context)
        
        addDotAtDegrees(-45, withColor: lightEnergy, andContext: context)
        addDotAtDegrees(energyDegrees, withColor: energyColor, andContext: context)
        
        
        //Avatar circle
        CGContextSetBlendMode(context, kCGBlendModeNormal)

        
        UIColor.lightGrayColor().set()
        let avatarRect = CGRectInset(rect, 15, 15)
        CGContextFillEllipseInRect(context, avatarRect)
        
    }
    
    func addDotAtDegrees(degrees: Double, withColor color: UIColor, andContext context: CGContextRef) {
        
        let angle = CGFloat(DegreesToRadians(degrees))
        
        let x = (bounds.width/2) + (bounds.width/2 - 5) * cos(angle)
        let y = (bounds.width/2) + (bounds.height/2 - 5) * sin(angle)
        
        color.set()
        
        
        CGContextSetLineCap(context, kCGLineCapRound)
        
        CGContextMoveToPoint(context, x, y)
        CGContextAddLineToPoint(context, x, y)
        
        CGContextStrokePath(context)
        
   
    }

}



func RadiansToDegrees (value:Double) -> Double {
    return value * 180.0 / M_PI
}

enum Angle {
    case Radians(Double)
    case Degrees(Double)
    
    var scalar: Double {
        switch(self) {
        case .Radians(let v):
            return v
        case .Degrees(let v):
            return v
        }
    }
    
    var radians: Angle {
        switch(self) {
        case .Radians(_):
            return self
        case .Degrees(let value):
            return .Radians(DegreesToRadians(value))
        }
    }
    
    var degrees: Angle {
        switch(self) {
        case .Degrees(let value):
            return .Degrees(RadiansToDegrees(value))
        case .Radians(_):
            return self
        }
    }
}



