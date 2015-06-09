//
//  ControllerButtons.swift
//  StuffedAnimalMortalKombat
//
//  Created by Kyle Brooks Robinson on 6/9/15.
//  Copyright (c) 2015 Kyle Brooks Robinson. All rights reserved.
//

import UIKit

@IBDesignable class ControllerActionButtons: UIButton {
    
    @IBInspectable var buttonColor: UIColor = UIColor.blueColor()
    
    override func drawRect(rect: CGRect) {
    
        var path = UIBezierPath(ovalInRect: rect)
        buttonColor.setFill()
        path.fill()
        
    
    }
    
    

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}

