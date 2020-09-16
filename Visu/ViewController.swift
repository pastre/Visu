//
//  ViewController.swift
//  Visu
//
//  Created by Bruno Pastre on 15/09/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import SpriteKit
import UIKit

class ViewController: UIViewController {

    var scene: VSScene!
    
    let skView: SKView = {
        let view = SKView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupSKView()
    }
    
    func setupSKView() {
        
        self.view.addSubview(self.skView)
        
        skView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        skView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        skView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        skView.heightAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true
    }
    
    override func viewDidLayoutSubviews() {
        
        self.setupVSScene()
    }
    
    func setupVSScene() {
        self.scene = VSScene(size: self.view.frame.size)
        scene.backgroundColor = .black
        self.scene.scaleMode = .aspectFill
        scene.size = self.skView.frame.size
        self.skView.presentScene(self.scene)

        skView.ignoresSiblingOrder = true
        
        skView.showsFPS = true
        skView.showsNodeCount = true
    }

}

extension CGPoint {
    static func random(xRange: ClosedRange<CGFloat>, yRange: ClosedRange<CGFloat>) -> CGPoint {
        return CGPoint(x: .random(in: xRange), y: .random(in: yRange))
    }
}
