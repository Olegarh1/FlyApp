//
//  GameScene.swift
//  FlyApp
//
//  Created by Oleg Zakladnyi on 16.09.2024.
//

import SpriteKit
import GameplayKit
import CoreMotion

class GameScene: SKScene {

    //MARK: - Private variebles
    private var player: SKSpriteNode!
    private let motionManager = CMMotionManager()
    private var xAcceleration: CGFloat = 0
    
    //MARK: - Lifecycle
    override func didMove(to view: SKView) {
        configureStartScene()
        spawnClouds()
        spawnIslands()
    }
    
    override func didSimulatePhysics() {
        super.didSimulatePhysics()
        
        changePosition()
    }
    
    //MARK: - Private function
    private func configureStartScene(){
        let screenCenterPoint = CGPoint(x: self.size.width / 2 , y: self.size.height / 2)
        let background = Background.populatesBackgrounds(at: screenCenterPoint)
        background.size = self.size
        self.addChild(background)
        
        let screen = UIScreen.main.bounds
        
        let island1 = Island.popluate(at: CGPoint(x: 100, y: 200))
        self.addChild(island1)
        
        let island2 = Island.popluate(at: CGPoint(x: self.size.width - 100, y: self.size.height - 200))
        self.addChild(island2)
        
        player = Player.populate(at: CGPoint(x: screen.size.width / 2, y: 100))
        self.addChild(player)
        
        motionManager.accelerometerUpdateInterval = 0.2
        motionManager.startAccelerometerUpdates(to: OperationQueue.current!) { (data, error) in
            if let data = data {
                let acceleration = data.acceleration
                self.xAcceleration = CGFloat(acceleration.x) * 0.7 + self.xAcceleration * 0.3
                
            }
        }
    }
    
    private func spawnClouds() {
        let spawnCloudWait = SKAction.wait(forDuration: 1)
        let spawnCloudAction = SKAction.run{
            let cloud = Cloud.popluate()
            self.addChild(cloud)
        }
        let spawnCloudSequence = SKAction.sequence([spawnCloudAction, spawnCloudWait])
        let spawnCloudForever = SKAction.repeatForever(spawnCloudSequence)
        run(spawnCloudForever)
    }
    
    private func spawnIslands() {
        let spawnIslandWait = SKAction.wait(forDuration: 2)
        let spawnIslandAction = SKAction.run{
            let island = Island.popluate()
            self.addChild(island)
        }
        let spawnIslandSequence = SKAction.sequence([spawnIslandAction, spawnIslandWait])
        let spawnIslandForever = SKAction.repeatForever(spawnIslandSequence)
        run(spawnIslandForever)
    }
    
    private func changePosition() {
        player.position.x += xAcceleration * 50
        if player.position.x < -70{
            player.position.x = self.size.width + 70
            
        } else if player.position.x > self.size.width + 70 {
            player.position.x = -70
        }
    }
}
