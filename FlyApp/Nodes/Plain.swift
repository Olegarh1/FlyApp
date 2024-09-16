//
//  Plain.swift
//  FlyApp
//
//  Created by Oleg Zakladnyi on 16.09.2024.
//

import SpriteKit

class Player: SKSpriteNode {
    static func populate(at point: CGPoint) -> SKSpriteNode {
        let playerPlainTexture = SKTexture(imageNamed: "airplane_3ver2_13")
        let playerPlane = SKSpriteNode(texture: playerPlainTexture)
        playerPlane.setScale(0.5)
        playerPlane.position = point
        playerPlane.zPosition = 20
        
        return playerPlane
    }
}
