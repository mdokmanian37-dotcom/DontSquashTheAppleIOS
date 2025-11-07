//
//  MainMenuScene.swift
//  DontSquashTheAppleIOS
//
//  Created by  on 11/7/25.
//
import SpriteKit
import GameplayKit


class CreditsScene: SKScene {
   
    
    override func didMove(to view: SKView) {
        
       
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            print("touch \(location)")
//            if backButton.contains(location){
//                let gameScene = MainMenuScene(size: self.size)
//                gameScene.scaleMode = .aspectFill
//                self.view?.presentScene(gameScene, transition: .doorsCloseVertical(withDuration: 0.5))
//            }
        }
    }
}
