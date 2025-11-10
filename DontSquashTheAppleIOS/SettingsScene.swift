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
    let chooseApple = SKSpriteNode(imageNamed: "apple")
    let choosePump = SKSpriteNode(imageNamed: "pumpkin")
    
    override func didMove(to view: SKView) {
        
        topText.fontName = "PressStart2P"
        topText.fontSize = 48
        topText.position = CGPoint(x: frame.midX, y: frame.maxY - 150)
        addChild(topText)
        
        backButton.fontName = "PressStart2P"
        backButton.fontSize = 32
        backButton.position = CGPoint(x: frame.minX + 100, y: frame.maxY - 150)
        addChild(backButton)
        
        chooseApple.position = CGPoint(x: frame.midX - 100, y: frame.midY)
        chooseApple.size = CGSize(width: 150, height: 150)
        addChild(chooseApple)
        
        choosePump.position = CGPoint(x: frame.midX + 100, y: frame.midY)
        choosePump.size = CGSize(width: 150, height: 150)
        addChild(choosePump)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            print("touch \(location)")
            if backButton.contains(location){
                let gameScene = MainMenuScene(size: self.size)
                gameScene.scaleMode = .aspectFill
                self.view?.presentScene(gameScene, transition: .doorsCloseVertical(withDuration: 0.5))
//                chooseApple.removeFromParent()
//                choosePump.removeFromParent()
            }
            if chooseApple.contains(location){
//                pick the apple
                SettingsManager.shared.choice = 1
                print(SettingsManager.shared.choice)
            }
            if choosePump.contains(location){
                // pick the pumpkin
                SettingsManager.shared.choice = 2
                print(SettingsManager.shared.choice)
            }
            
        }
    }
}
