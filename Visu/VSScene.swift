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
    }
    
    
    func setupRotator() {
        let node = SKShapeNode(circleOfRadius: 20)
        let debug = SKShapeNode(circleOfRadius: 10)
        
        node.name = NodeNames.rotator.rawValue
        node.fillColor = .red
        
        debug.name = NodeNames.debug.rawValue
        debug.fillColor = .green
        
        self.addChild(node)
        
        node.addChild(debug)
        
        debug.position.x += 40
        debug.position.y += 40
    }
    
    func getRotator() -> SKNode? { self.childNode(withName: NodeNames.rotator.rawValue) }
    
}
