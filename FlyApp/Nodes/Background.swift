//
//  Background.swift
//  FlyApp
//
//  Created by Oleg Zakladnyi on 16.09.2024.
//

import SpriteKit

final class Background: SKSpriteNode {
    static func populatesBackgrounds(at point: CGPoint) -> Background {
        let background = Background(imageNamed: "background")
        background.position = point
        background.zPosition = 0
        
        return background
    }
}
