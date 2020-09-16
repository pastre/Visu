//
//  VSSceneManager.swift
//  Visu
//
//  Created by Bruno Pastre on 16/09/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import SpriteKit

class VSSceneManager: NSObject, SKSceneDelegate {
    
    // Angular speed
    let ω: CGFloat = 1

    var lastTime: TimeInterval?
    
    func update(_ currentTime: TimeInterval, for scene: SKScene) {
        
        guard let scene = scene as? VSScene else { return }
        guard let rotator = scene.getRotator() else { return }
        
        defer { self.lastTime = currentTime }
        guard let lastTime = self.lastTime else { return }
        
        let deltaTime = CGFloat(currentTime - lastTime)
        
        // Angular variation
        self.rotate(rotator, deltaTime: deltaTime)
    }
    
    private func rotate(_ node: SKNode, deltaTime: CGFloat) {
        let dΘ = deltaTime * ω
        
        node.zRotation = (node.zRotation + dΘ).truncatingRemainder(dividingBy: 2 * .pi)
        
    }
}

