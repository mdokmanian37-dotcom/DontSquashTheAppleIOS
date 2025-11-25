//
//  CatchGameScene.swift
//  DontSquashTheAppleIOS
//
//  Created by  on 11/18/25.
//

import SpriteKit
import GameplayKit

let newBottomB = SKSpriteNode(color: .green, size: CGSize(width: 1334, height: 20))
let newLivesNode = SKLabelNode(text: "Lives: 3")
let newScoreNode = SKLabelNode(text: "Score: 0")
var newLives = 3
var newScore = 0
let newBackButton = SKLabelNode(text: "Quit")
let basket = SKSpriteNode(imageNamed: "basket")
let newResetButton = SKLabelNode(text: "Restart")
var theImage = "apple"

class CatchGameScene: SKScene, SKPhysicsContactDelegate{
    override func didMove(to view: SKView) {
        newBottomB.physicsBody = SKPhysicsBody(rectangleOf: newBottomB.size)
        newBottomB.position = CGPoint(x: frame.midX, y: frame.minY + 75)
        newBottomB.physicsBody?.pinned = true
        newBottomB.physicsBody?.allowsRotation = false
        newBottomB.physicsBody?.categoryBitMask = 4
        newBottomB.physicsBody?.contactTestBitMask = 8
        
        addChild(newBottomB)
        
        newResetButton.position = CGPoint(x: frame.midX, y: frame.midY - 100)
        newResetButton.fontName = "PressStart2P"
        newResetButton.alpha = 0
        addChild(newResetButton)
        
        newLivesNode.position = CGPoint(x: frame.midX, y: frame.maxY - 125)
        newLivesNode.fontName = "PressStart2P"
        newLivesNode.text = "Lives: \(newLives)"
        
        addChild(newLivesNode)
        
        newScoreNode.position = CGPoint(x: frame.midX, y: frame.maxY - 200)
        newScoreNode.fontName = "PressStart2P"
        newScoreNode.text = "Score: \(newScore)"
        
        addChild(newScoreNode)
        
        newBackButton.fontName = "PressStart2P"
        newBackButton.fontSize = 32
        newBackButton.position = CGPoint(x: frame.minX + 100, y: frame.maxY - 150)
        addChild(newBackButton)
        
        basket.physicsBody = SKPhysicsBody(circleOfRadius: 37)
        basket.position = CGPoint(x: frame.midX, y: frame.minY + 200)
        basket.size = CGSize(width: 150, height: 75)
        basket.physicsBody?.allowsRotation = false
        basket.physicsBody?.restitution = 0
        basket.physicsBody?.linearDamping = 0
        basket.physicsBody?.angularDamping = 0
        basket.physicsBody?.friction = 0
        basket.physicsBody?.categoryBitMask = 2
        addChild(basket)
        run(SKAction.repeatForever(SKAction.sequence([SKAction.wait(forDuration: 2), SKAction.run {
            if newLives >= 0 {
//                var random = Int.random(in: 1...4)
                let random = [
                    1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
                    2,2,2,2,2,
                    3,3,3,3,3,
                    4,4,4,
                    5,5
                ]
                
                // apple 85% apple2nd 5% apple3rd 5% apple4th 3% apple5th 2%
//                let newRandom = Int.random(in: 1...100)
                var theSize: CGSize = CGSize(width: 60, height: 60)
                
                switch random.randomElement()!{
                case 1:
                    theImage = "apple"
                    theSize = CGSize(width: 60, height: 60)
                case 2:
                    theImage = "apple2nd"
                    theSize = CGSize(width: 60, height: 60)
                case 3:
                    theImage = "apple3rd"
                    theSize = CGSize(width: 70, height: 60)
                case 4:
                    theImage = "apple4th"
                    theSize = CGSize(width: 80, height: 60)
                case 5:
                    theImage = "apple5th"
                    theSize = CGSize(width: 60,height: 60)
                default:
                    theImage = "apple"
                    theSize = CGSize(width: 60, height: 60)
                }
                
                self.newMakeApple(pos: CGPoint(x: basket.position.x - Double.random(in: -275...275), y: 640), image: theImage, size: theSize)
            }
        }])))
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        self.physicsWorld.contactDelegate = self
    }
    func newMakeApple(pos:CGPoint, image: String, size: CGSize){
        let newApple = SKSpriteNode(imageNamed: "\(image)")
        newApple.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 87.5, height: 87.5))
        newApple.size = size
        newApple.position = pos
        newApple.physicsBody?.categoryBitMask = 8
        newApple.physicsBody?.contactTestBitMask = 2 | 4
        
        addChild(newApple)
        
    }
    
    func newReset(){
        newLives = 3
        newScore = 0
        newLivesNode.text = "Lives: \(newLives)"
        newScoreNode.text = "Score: \(newScore)"
        basket.position = CGPoint(x: frame.midX, y: frame.minY + 200)
        newResetButton.alpha = 0
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            
            let location = touch.location(in: self)
            if newBackButton.contains(location){
                let gameScene = MainMenuScene(size: self.size)
                gameScene.scaleMode = .aspectFill
                self.view?.presentScene(gameScene, transition: .doorsCloseHorizontal(withDuration: 0.5))
                newLivesNode.removeFromParent()
                newScoreNode.removeFromParent()
                newBackButton.removeFromParent()
                newBottomB.removeFromParent()
                basket.removeFromParent()
                newResetButton.removeFromParent()
                newReset()
            
            }
            if newResetButton.contains(location){
                if newResetButton.alpha == 1{
                    newReset()
                }
            }
            if location.x > frame.midX{
                basket.physicsBody?.velocity = CGVector(dx: 350, dy: 0)
            }
            if location.x < frame.midX{
                basket.physicsBody?.velocity = CGVector(dx: -350, dy: 0)
            }
            
        }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        basket.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
    }
    func didBegin(_ contact: SKPhysicsContact) {
        if contact.bodyA.categoryBitMask == 2 && contact.bodyB.categoryBitMask == 8{
            contact.bodyB.node?.removeFromParent()
            if theImage == "apple"{
                newScore += 1
            }else if theImage == "apple2nd"{
                newScore -= 1
            }else if theImage == "apple3rd"{
                newScore -= 2
            }else if theImage == "apple4th"{
                newScore -= 3
            }else if theImage == "apple5th"{
                newScore += 5
            }
            if newScore < 0{
                newLivesNode.text = "GAME OVER"
                newResetButton.alpha = 1
                newLives = -1
            }
            
            newScoreNode.text = "Score: \(newScore)"
        }
        if contact.bodyA.categoryBitMask == 8 && contact.bodyB.categoryBitMask == 2{
            contact.bodyA.node?.removeFromParent()
            if theImage == "apple"{
                newScore += 1
            }else if theImage == "apple2nd"{
                newScore -= 1
            }else if theImage == "apple3rd"{
                newScore -= 2
            }else if theImage == "apple4th"{
                newScore -= 3
            }else if theImage == "apple5th"{
                newScore += 5
            }
            newScoreNode.text = "Score: \(newScore)"
            if newScore < 0{
                newLivesNode.text = "GAME OVER"
                newResetButton.alpha = 1
                newLives = -1
            }
        }
        if contact.bodyA.categoryBitMask == 4 && contact.bodyB.categoryBitMask == 8{
            contact.bodyB.node?.removeFromParent()
            if theImage == "apple"{
                newLives -= 1
            }else if theImage == "apple2nd"{
                
            }else if theImage == "apple3rd"{
                
            }else if theImage == "apple4th"{
                
            }else if theImage == "apple5th"{
                newLives -= 1
                
            }
            
            
            if newLives > 0{
                newLivesNode.text = "Lives: \(newLives)"
            }
            if newLives == 2{
                
            }else if newLives == 1{
                
            }else if newLives == 0{
                // play animation
                
                newLivesNode.text = "Last life!"
            }else if newLives < 0{
                
                newLivesNode.text = "GAME OVER"
                newResetButton.alpha = 1
            }

        }
        if contact.bodyA.categoryBitMask == 8 && contact.bodyB.categoryBitMask == 4{
            contact.bodyA.node?.removeFromParent()
            if theImage == "apple"{
                newLives -= 1
            }else if theImage == "apple2nd"{
                
            }else if theImage == "apple3rd"{
                
            }else if theImage == "apple4th"{
                
            }else if theImage == "apple5th"{
                newLives -= 1
            }
            if newLives > 0{
                newLivesNode.text = "Lives: \(newLives)"
                
            }
            if newLives == 2{
                
            }else if newLives == 1{
                
            }else if newLives == 0{
                // play animation
                
                newLivesNode.text = "Last life!"
            }else if newLives < 0{
                
                newLivesNode.text = "GAME OVER"
                newResetButton.alpha = 1
            }
        }
    }
}
