//
//  ControllerViewController.swift
//  StuffedAnimalMortalKombat
//
//  Created by Kyle Brooks Robinson on 6/9/15.
//  Copyright (c) 2015 Kyle Brooks Robinson. All rights reserved.
//

import UIKit

class ControllerViewController: UIViewController {

    @IBAction func pressedUp(sender: AnyObject) {
        
        let info = ["action":"jump"]
        
        if let data = NSJSONSerialization.dataWithJSONObject(info, options: NSJSONWritingOptions.allZeros, error: nil) {
            
            Connector.sharedConnector().sendDataToWorld(data)
            
        }
        
    }
    
    @IBAction func pressedLeft(sender: AnyObject) {
    }
    @IBAction func pressedRight(sender: AnyObject) {
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Connector.sharedConnector().controller = self
        Connector.sharedConnector().startAdvertising() //iPhone

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
