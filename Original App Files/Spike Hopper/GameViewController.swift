//
//  GameViewController.swift
//  SpikeHopper
//
//  Created by Sevan Productions on 8/19/15.
//  Copyright (c) 2015 Sevan Productions. All rights reserved.
//

import UIKit
import SpriteKit
import AVFoundation
import GameKit
import iAd

class GameViewController: UIViewController, ADBannerViewDelegate  {
    
    @IBOutlet var skView: SKView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        authenticateLocalPlayer()

        
        if let scene = MainMenu(fileNamed: "GameScene") {
            
            //Configure the view.
            
            skView.showsFPS = false
            skView.showsNodeCount = false
            skView.showsPhysics = true
            scene.size = skView.bounds.size
            
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            skView.ignoresSiblingOrder = true
            
            /* Set the scale mode to scale to fit the window */
            scene.scaleMode = .aspectFill
            
            skView.presentScene(scene)
            
        }
    }



    
    
    //initiate gamecenter
    func authenticateLocalPlayer(){
        
        let localPlayer = GKLocalPlayer.localPlayer()
        
        localPlayer.authenticateHandler = {(viewController, error) -> Void in
            
            if (viewController != nil) {
                self.present(viewController!, animated: true, completion: nil)
            }
                
            else {
                print((GKLocalPlayer.localPlayer().isAuthenticated))
            }
        }
        
    }
    
    open override var shouldAutorotate: Bool {
        get{
        return true
        }
    }
    
    open override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    open override var prefersStatusBarHidden: Bool {
        return true
    }
}
