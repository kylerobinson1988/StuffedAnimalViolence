//
//  Connector.swift
//  StuffedAnimalMortalKombat
//
//  Created by Kyle Brooks Robinson on 6/9/15.
//  Copyright (c) 2015 Kyle Brooks Robinson. All rights reserved.
//

import UIKit
import MultipeerConnectivity

private let _singleton = Connector()

private let _serviceType = "SAMK"

class Connector: NSObject, MCSessionDelegate, MCNearbyServiceAdvertiserDelegate, MCNearbyServiceBrowserDelegate {
   
    class func sharedConnector() -> Connector { return _singleton }
    
    var browser: MCNearbyServiceBrowser? // iPad
    var advertiser: MCNearbyServiceAdvertiser? // iPhone

    var session: MCSession?
    
    var myPeerID: MCPeerID?
    
    var myInfo: [String:AnyObject] = [:]
    
    var gameBoard: GameViewController?
    var controller: ControllerViewController?
    
    func startBrowsing() { //iPad
        
        myPeerID = MCPeerID(displayName: "World")
        session = MCSession(peer: myPeerID)
        session?.delegate = self
        
        browser = MCNearbyServiceBrowser(peer: myPeerID, serviceType: _serviceType)
        browser?.delegate = self
        
        browser?.startBrowsingForPeers()
        
    }
    
    func startAdvertising() { //iPhone
        
        myPeerID = MCPeerID(displayName: "Rocktransformed")
        session = MCSession(peer: myPeerID)
        session?.delegate = self

        advertiser = MCNearbyServiceAdvertiser(peer: myPeerID, discoveryInfo: myInfo, serviceType: _serviceType)
        advertiser?.delegate = self
        
        advertiser?.startAdvertisingPeer()
    }
    
    ///////// MARK: Browser Delegate
    
    func browser(browser: MCNearbyServiceBrowser!, foundPeer peerID: MCPeerID!, withDiscoveryInfo info: [NSObject : AnyObject]!) {
        
        // The below line invites the peer.
        browser.invitePeer(peerID, toSession: session, withContext: nil, timeout: 30)
        
        
    }
    
    
    func browser(browser: MCNearbyServiceBrowser!, lostPeer peerID: MCPeerID!) {
        
        println("lost " + peerID.displayName)

        
    }
    
    ///////// MARK: Advertiser Delegate
    
    func advertiser(advertiser: MCNearbyServiceAdvertiser!, didReceiveInvitationFromPeer peerID: MCPeerID!, withContext context: NSData!, invitationHandler: ((Bool, MCSession!) -> Void)!) {
        
        println("invitation from " + peerID.displayName)
        
        invitationHandler(true, session)
        
    }
    
    ///////// MARK: Session Delegate
    
    func session(session: MCSession!, didFinishReceivingResourceWithName resourceName: String!, fromPeer peerID: MCPeerID!, atURL localURL: NSURL!, withError error: NSError!) {
        
    }
    
    func session(session: MCSession!, didReceiveData data: NSData!, fromPeer peerID: MCPeerID!) {
        
    }
    
    func session(session: MCSession!, didReceiveStream stream: NSInputStream!, withName streamName: String!, fromPeer peerID: MCPeerID!) {
        
        
        
        
    }
    
    func session(session: MCSession!, didStartReceivingResourceWithName resourceName: String!, fromPeer peerID: MCPeerID!, withProgress progress: NSProgress!) {
        
    }
    
    func session(session: MCSession!, peer peerID: MCPeerID!, didChangeState state: MCSessionState) {
        
        let stateArray = [
            "NotConnected",
            "Connecting",
            "Connected"
        ]
        
        println("state \(stateArray[state.rawValue]) to " + peerID.displayName)
        
    }

}
