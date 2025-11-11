//
//  MainMenuScene.swift
//  DontSquashTheAppleIOS
//
//  Created by  on 11/7/25.
//
import SpriteKit
import GameplayKit


class CreditsScene: SKScene {
   let backButton = SKLabelNode(text: "Back")
    let creditsLabel = SKLabelNode(text: "Credits")
    let michael = SKLabelNode(text: "Michael: All the code")
    let mia = SKLabelNode(text: "Mia(My girlfriend!!):")
    let mia2 = SKLabelNode(text: "All the cool pictures and backgrounds")
    
    override func didMove(to view: SKView) {
        backButton.fontName = "PressStart2P"
        backButton.fontSize = 32
        backButton.position = CGPoint(x: frame.minX + 100, y: frame.maxY - 150)
        addChild(backButton)
        
        creditsLabel.fontName = "PressStart2P"
        creditsLabel.fontSize = 100
        creditsLabel.position = CGPoint(x: frame.midX, y:frame.maxY - 175)
        addChild(creditsLabel)
        
        michael.fontName = "PressStart2P"
        michael.fontSize = 50
        michael.position = CGPoint(x: frame.midX, y: frame.midY + 100)
        addChild(michael)
        
        mia.fontName = "PressStart2P"
        mia.fontSize = 50
        mia.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(mia)
        mia2.fontName = "PressStart2P"
        mia2.fontSize = 50
        mia2.position = CGPoint(x: frame.midX, y: frame.midY - 55)
        addChild(mia2)
       
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
