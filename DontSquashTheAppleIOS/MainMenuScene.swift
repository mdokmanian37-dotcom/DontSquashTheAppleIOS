//
//  MainMenuScene.swift
//  DontSquashTheAppleIOS
//
//  Created by  on 11/7/25.
//
import SpriteKit
import GameplayKit


class MainMenuScene: SKScene {
    let title = SKLabelNode(text: "Don't Squash The Apple!")
    let playButton = SKLabelNode(text: "New Game")
    let settingsButton = SKLabelNode(text: "Customize")

    override func didMove(to view: SKView) {
        title.fontName = "PressStartP2"
        title.fontSize = 100
        title.position = CGPoint(x: frame.midX, y: frame.maxY - 250)
        addChild(title)
        
        playButton.fontSize = 40
        playButton.fontName = "PressStartP2"
        playButton.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(playButton)
        
        settingsButton.fontSize = 40
        settingsButton.fontName = "PressStartP2"
        settingsButton.position = CGPoint(x: frame.midX, y: frame.midY - 100)
        addChild(settingsButton)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            for touch in touches {
                let location = touch.location(in: self)
                print("touch \(location)")
                
                if playButton.contains(location) {
                    let gameScene = GameScene(size: self.size)
                    gameScene.scaleMode = .aspectFill
                    self.view?.presentScene(gameScene, transition: .doorsOpenHorizontal(withDuration: 0.5))
                }
                if settingsButton.contains(location){
                    let gameScene = SettingsScene(size: self.size)
                    gameScene.scaleMode = .aspectFill
                    self.view?.presentScene(gameScene, transition: .doorsOpenVertical(withDuration: 0.5))
                }
            }
        }
}
