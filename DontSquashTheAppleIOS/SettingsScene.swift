//
//  MainMenuScene.swift
//  DontSquashTheAppleIOS
//
//  Created by  on 11/7/25.
//
import SpriteKit
import GameplayKit


class SettingsScene: SKScene {
    let backButton = SKLabelNode(text: "Back")
    let topText = SKLabelNode(text: "Customization Center")
    
    override func didMove(to view: SKView) {
        
        topText.fontName = "PressStart2P"
        topText.fontSize = 48
        topText.position = CGPoint(x: frame.midX, y: frame.maxY - 150)
        addChild(topText)
        
        backButton.fontName = "PressStart2P"
        backButton.fontSize = 32
        backButton.position = CGPoint(x: frame.minX + 100, y: frame.maxY - 150)
        addChild(backButton)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            print("touch \(location)")
            if backButton.contains(location){
                let gameScene = MainMenuScene(size: self.size)
                gameScene.scaleMode = .aspectFill
                self.view?.presentScene(gameScene, transition: .doorsCloseVertical(withDuration: 0.5))
            }
        }
    }
}
