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
    let appleSignal = SKLabelNode(text: "You chose the Apple")
    let pumpSignal = SKLabelNode(text: "You chose the Pumpkin")
    var appleLock = 0
    var pumpLock = 0
    
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
        
        appleSignal.position = CGPoint(x: chooseApple.position.x, y: frame.midY + 75)
        appleSignal.fontName = "PressStart2P"
        appleSignal.fontSize = 25
        appleSignal.alpha = 0
        addChild(appleSignal)
        
        pumpSignal.position = CGPoint(x: choosePump.position.x, y: frame.midY + 75)
        pumpSignal.fontName = "PressStart2P"
        pumpSignal.fontSize = 25
        pumpSignal.alpha = 0
        addChild(pumpSignal)
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
                if appleLock == 0{
                    SettingsManager.shared.choice = 1
                    print(SettingsManager.shared.choice)
                    appleSignal.alpha = 1
                    appleLock = 1
                    appleSignal.run(SKAction.fadeAlpha(to: 0, duration: 2))
                    appleSignal.run(SKAction.moveBy(x: 0, y: 30, duration: 2))
                    
                    run(SKAction.sequence([SKAction.wait(forDuration: 2),SKAction.run {
                        self.appleSignal.alpha = 0
                        self.appleLock = 0
                        self.appleSignal.position.y -= 30
                       
                    }]))
                }
            }
            if choosePump.contains(location){
                // pick the pumpkin
                if pumpLock == 0{
                    SettingsManager.shared.choice = 2
                    print(SettingsManager.shared.choice)
                    pumpSignal.alpha = 1
                    pumpLock = 1
                    pumpSignal.run(SKAction.fadeAlpha(to: 0, duration: 2))
                    pumpSignal.run(SKAction.moveBy(x: 0, y: 30, duration: 2))
                    run(SKAction.sequence([SKAction.wait(forDuration: 2),SKAction.run {
                        self.pumpSignal.alpha = 0
                        self.pumpLock = 0
                        self.pumpSignal.position.y -= 30
                    }]))
                }
                
                
            }
            
        }
    }
}
