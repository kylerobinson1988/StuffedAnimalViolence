//
//  JoinSessionViewController.swift
//  StuffedAnimalMortalKombat
//
//  Created by Kyle Brooks Robinson on 6/9/15.
//  Copyright (c) 2015 Kyle Brooks Robinson. All rights reserved.
//

import UIKit

class JoinSessionViewController: UIViewController {

    @IBOutlet weak var sessionLabel: UILabel!
    @IBOutlet weak var joinButtonOutlet: UIButton!
    
    @IBAction func joinButton(sender: AnyObject) {
        
        
    }
    
    @IBAction func quitButton(sender: AnyObject) {
        
        self.navigationController?.popToRootViewControllerAnimated(true)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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