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
        
        
        for _ in 0...70 {
            let color = colors.randomElement()!
            let radius = CGFloat.random(in: 3...8)
//            let newNode = SKShapeNode(circleOfRadius: radius)
            let newNode = SKNode()
            let particle = SKEmitterNode(fileNamed: "MyParticle")!
            
//            newNode.fillColor = color
//            newNode.strokeColor = .clear
            newNode.name = NodeNames.star.rawValue
            
//            newNode.position = .init(x: 40, y: 40)
            newNode.position = .random(
                xRange: (-self.size.width)...self.size.width,
                yRange: (-self.size.height)...self.size.height
            )
            
            particle.targetNode = self
            particle.particleColor = color
            particle.particleSize = CGSize(width: radius * 2, height: radius * 2)
            particle.particleTexture = SKTexture(image: UIImage.init(diameter: radius * 2, color: color)!)
            
            newNode.addChild(particle)
            
            self.getRotator()?.addChild(newNode)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            let location = t.location(in: self)
            self.getRotator()?.position = location
        }
    }
    
    func getRotator() -> SKNode? { self.childNode(withName: NodeNames.rotator.rawValue) }
    
}

extension UIImage {
    convenience init?(diameter: CGFloat, color: UIColor) {
        let size = CGSize(width: diameter, height: diameter)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        guard let contex = UIGraphicsGetCurrentContext() else {
            return nil
        }

        contex.saveGState()
        let rect = CGRect(origin: .zero, size: size)
        contex.setFillColor(color.cgColor)
        contex.fillEllipse(in: rect)
        contex.restoreGState()

        guard let image = UIGraphicsGetImageFromCurrentImageContext(),
        let cgImage = image.cgImage else {
            return nil
        }
        UIGraphicsEndImageContext()

        self.init(cgImage: cgImage)
    }
}
