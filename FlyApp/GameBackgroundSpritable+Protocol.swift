//
//  GameBackgroundSpritable+Protocol.swift
//  FlyApp
//
//  Created by Oleg Zakladnyi on 16.09.2024.
//

import SpriteKit
import GameplayKit

protocol GameBackgroundSpritable {
    static func popluate() -> Self
    static func randomPoint() -> CGPoint
}

extension GameBackgroundSpritable{
    static func randomPoint() -> CGPoint{
        let screen = UIScreen.main.bounds
        let distribution = GKRandomDistribution(lowestValue: Int(screen.size.height) + 100, highestValue: Int(screen.size.height) + 200)
        let y: CGFloat = CGFloat(distribution.nextInt())
        let x: CGFloat = CGFloat(GKRandomSource.sharedRandom().nextInt(upperBound: Int(screen.size.width)))
        return CGPoint(x:x, y:y)
    }
}
