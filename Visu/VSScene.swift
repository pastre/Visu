//
//  VSScene.swift
//  Visu
//
//  Created by Bruno Pastre on 16/09/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import SpriteKit

class VSScene: SKScene {
    
    let manager = VSSceneManager()
    
    override func didMove(to view: SKView) {
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.size = view.frame.size
        
        self.delegate = manager
        
        self.setupRotator()
        self.populateStars()
    }
    
    
    func setupRotator() {
        let node = SKNode()

        node.name = NodeNames.rotator.rawValue
        
        self.addChild(node)
        
    }
    func populateStars() {
        
        let colors = [
            UIColor(red: 0xF9/0xFF, green: 0x41/0xFF, blue: 0x44/0xFF, alpha: 1),
            UIColor(red: 0xF3/0xFF, green: 0x72/0xFF, blue: 0x2C/0xFF, alpha: 1),
            UIColor(red: 0xF9/0xFF, green: 0xC7/0xFF, blue: 0x4F/0xFF, alpha: 1),
            UIColor(red: 0x43/0xFF, green: 0xAA/0xFF, blue: 0x8B/0xFF, alpha: 1),
            UIColor(red: 0x27/0xFF, green: 0x7D/0xFF, blue: 0xA1/0xFF, alpha: 1),
        ]
        
        
        for _ in 0...500 {
            let newNode = SKShapeNode(circleOfRadius: .random(in: 3...10))
            
            newNode.fillColor = colors.randomElement()!
            newNode.strokeColor = .clear
            
            newNode.name = NodeNames.star.rawValue
            newNode.position = .random(
                xRange: (-self.size.width)...self.size.width,
                yRange: (-self.size.height)...self.size.height
            )
            
            self.getRotator()?.addChild(newNode)
        }
    }
    
    func getRotator() -> SKNode? { self.childNode(withName: NodeNames.rotator.rawValue) }
    
}
