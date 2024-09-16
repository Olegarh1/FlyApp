//
//  GameViewController.swift
//  FlyApp
//
//  Created by Oleg Zakladnyi on 16.09.2024.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as? SKView {
            let scene = GameScene(size: self.view.bounds.size)
            scene.scaleMode = .aspectFill
            view.presentScene(scene)
            
            view.ignoresSiblingOrder = true
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }

    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
       return .portrait
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
