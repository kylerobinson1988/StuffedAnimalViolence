//
//  GameViewController.swift
//  StuffedAnimalMortalKombat
//
//  Created by Kyle Brooks Robinson on 6/9/15.
//  Copyright (c) 2015 Kyle Brooks Robinson. All rights reserved.
//

import UIKit
import SpriteKit
import MultipeerConnectivity

extension SKNode {
    class func unarchiveFromFile(file : String) -> SKNode? {
        if let path = NSBundle.mainBundle().pathForResource(file, ofType: "sks") {
            var sceneData = NSData(contentsOfFile: path, options: .DataReadingMappedIfSafe, error: nil)!
            var archiver = NSKeyedUnarchiver(forReadingWithData: sceneData)
            
            archiver.setClass(self.classForKeyedUnarchiver(), forClassName: "SKScene")
            let scene = archiver.decodeObjectForKey(NSKeyedArchiveRootObjectKey) as! GameScene
            archiver.finishDecoding()
            return scene
        } else {
            return nil
        }
    }
}

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Connector.sharedConnector().gameBoard = self
        Connector.sharedConnector().startBrowsing() //iPad command.

        if let scene = GameScene.unarchiveFromFile("GameScene") as? GameScene {
            // Configure the view.
            let skView = self.view as! SKView
            skView.showsFPS = true
            skView.showsNodeCount = true
            
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            skView.ignoresSiblingOrder = true
            
            /* Set the scale mode to scale to fit the window */
            scene.scaleMode = .AspectFill
            
            skView.presentScene(scene)
        }
    }
    
    var playerViews: [PlayerStats] = []
    
    func playerJoined(peerID: MCPeerID) {
        
        // Add stats area
        
        // Add player sprite mode
        
        if let playerVC = storyboard?.instantiateViewControllerWithIdentifier("playerStats") as? UIViewController {
            
            let playerView = playerVC.view as! PlayerStats
           
            playerView.playerName.text = peerID.displayName
            
            playerViews.append(playerView)
            
        }
        
        layoutPlayerStats()
        
    }
    
    func playerLeft(peerID: MCPeerID) {
        
        // Remove stats area & update stats layout if stats area was not at end
        
        // Remove player sprite node (possibly by exploding them)

        var foundPlayerViewIndex: Int?
        
        for (p,playerView) in enumerate(playerViews) {
            
            if playerView.playerName.text == peerID.displayName {
                
                foundPlayerViewIndex = p
                
            }
            
        }
        
        if let foundPlayerViewIndex = foundPlayerViewIndex {
            
            playerViews[foundPlayerViewIndex].removeFromSuperview()
            playerViews.removeAtIndex(foundPlayerViewIndex)
            
        }
        
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            
            self.layoutPlayerStats()
            
        })
        
        layoutPlayerStats()
        
    }
    
    func layoutPlayerStats() {
        
        let padding: CGFloat = 20
        let maxPlayers: CGFloat = 8
        
        let playerStatsWidth = (view.frame.width - (padding * (maxPlayers + 1))) / maxPlayers
        
        for (p,playerView) in enumerate(playerViews) {
            
            view.addSubview(playerView)
            
            let x = (playerStatsWidth + padding) * CGFloat(p) + padding
            
            playerView.frame = CGRectMake(x, 20, playerStatsWidth, 300)
            
        }
        
    }

    override func shouldAutorotate() -> Bool {
        return true
    }

    override func supportedInterfaceOrientations() -> Int {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return Int(UIInterfaceOrientationMask.AllButUpsideDown.rawValue)
        } else {
            return Int(UIInterfaceOrientationMask.All.rawValue)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
