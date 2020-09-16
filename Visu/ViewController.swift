//
//  ViewController.swift
//  Visu
//
//  Created by Bruno Pastre on 15/09/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import SpriteKit
import UIKit

class VSScene: SKScene {
    
}

class VSSceneManager: NSObject, SKSceneDelegate {
    
}

class ViewController: UIViewController, SKSceneDelegate {

    let scene: VSScene = {
        let scene = VSScene()
        
        scene.backgroundColor = .blue
        
        return scene
    }()
    
    let skView: SKView = {
        let view = SKView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupSKView()
        self.setupVSScene()
    }
    
    func setupSKView() {
        
        self.view.addSubview(self.skView)
        
        skView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        skView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        skView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        skView.heightAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true
    }

    func setupVSScene() {
        self.skView.presentScene(self.scene)
    }

}

