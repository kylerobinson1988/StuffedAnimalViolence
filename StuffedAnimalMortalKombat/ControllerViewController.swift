//
//  ControllerViewController.swift
//  StuffedAnimalMortalKombat
//
//  Created by Kyle Brooks Robinson on 6/9/15.
//  Copyright (c) 2015 Kyle Brooks Robinson. All rights reserved.
//

import UIKit



class ControllerViewController: UIViewController {

    @IBAction func upButton(sender: AnyObject) {
    }
    @IBAction func leftButton(sender: AnyObject) {
    }
    @IBAction func rightButton(sender: AnyObject) {
    }
    @IBAction func downButton(sender: AnyObject) {
    }
    
    @IBAction func blueXButton(sender: AnyObject) {
    }
    @IBAction func greenYButton(sender: AnyObject) {
    }
    @IBAction func redAButton(sender: AnyObject) {
    }
    @IBAction func yellowBButton(sender: AnyObject) {
    }
    
    
    @IBAction func disconnectButton(sender: AnyObject) {
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
