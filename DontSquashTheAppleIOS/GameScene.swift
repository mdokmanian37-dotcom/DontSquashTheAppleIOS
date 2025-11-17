//
//  GameScene.swift
//  DontSquashTheAppleIOS
//
//  Created by  on 11/6/25.
//
//test
import SpriteKit
import GameplayKit

var apple = SKSpriteNode(imageNamed: "")
let bottomB = SKSpriteNode(color: .green, size: CGSize(width: 1334, height: 20))
let livesNode = SKLabelNode(text: "Lives: 3")
let scoreNode = SKLabelNode(text: "Score: 0")
var lives = 3
var score = 0
let backButton = SKLabelNode(text: "Quit")
let resetButton = SKLabelNode(text: "Restart")
var firstP = ""
var secondP = ""
var thirdP = ""
var fourthP = ""
var highScoreG = 0
let highScoreNode = SKLabelNode(text: "HighScore: 0")
let highScore = DefaultsManager.loadUserDefaults()
class GameScene: SKScene,
    SKPhysicsContactDelegate {
        
    
    
        override func didMove(to view: SKView) {
//            let highScore = DefaultsManager.loadUserDefaults()
//            
//            highScoreG = highScore
            
            highScoreNode.text = "HighScore: \(highScore)"
            highScoreNode.position = CGPoint(x: frame.maxX - 150, y: frame.maxY - 130)
            highScoreNode.fontName = "PressStart2P"
            highScoreNode.fontSize = 32
            addChild(highScoreNode)
            
            
            
            resetButton.position = CGPoint(x: frame.midX, y: frame.midY - 100)
            resetButton.fontName = "PressStart2P"
            resetButton.alpha = 0
            addChild(resetButton)
            
            livesNode.position = CGPoint(x: frame.midX, y: frame.maxY - 125)
            livesNode.fontName = "PressStart2P"
            livesNode.text = "Lives: \(lives)"
            
            addChild(livesNode)
            
            scoreNode.position = CGPoint(x: frame.midX, y: frame.maxY - 200)
            scoreNode.fontName = "PressStart2P"
            scoreNode.text = "Score: \(score)"
            
            addChild(scoreNode)
            
            backButton.fontName = "PressStart2P"
            backButton.fontSize = 32
            backButton.position = CGPoint(x: frame.minX + 100, y: frame.maxY - 150)
            addChild(backButton)
            
            makeApple()
            
//            apple.physicsBody = SKPhysicsBody(circleOfRadius: 30)
//            apple.size = CGSize(width: 60, height: 60)
//            apple.position = CGPoint(x: frame.midX, y: frame.midY+50)
//            apple.physicsBody?.restitution = 0
//            apple.physicsBody?.categoryBitMask = 2
//            apple.physicsBody?.contactTestBitMask = 8
//            
//            
//            addChild(apple)
            
            bottomB.physicsBody = SKPhysicsBody(rectangleOf: bottomB.size)
            bottomB.position = CGPoint(x: frame.midX, y: frame.minY + 75)
            bottomB.physicsBody?.pinned = true
            bottomB.physicsBody?.allowsRotation = false
            bottomB.physicsBody?.categoryBitMask = 4
            bottomB.physicsBody?.contactTestBitMask = 8
            
            
            addChild(bottomB)
            
            
            
            
            
            run(SKAction.repeatForever(SKAction.sequence([SKAction.wait(forDuration: 2), SKAction.run {
                if lives >= 0 {self.makeBoulder(pos: CGPoint(x: apple.position.x - Double.random(in: -150...150), y: 640))}
            }])))
            
            self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
            self.physicsWorld.contactDelegate = self
        }
    override func update(_ currentTime: TimeInterval) {
//        if lives >= 0 {
//            run(SKAction.sequence([SKAction.wait(forDuration: 2), SKAction.run{
//                self.makeBoulder(pos: CGPoint(x: apple.position.x - Double.random(in: -150...150), y: 640))
//            }]))
//        }else{
//            print("no rock")
//        }
    }
    func makeBoulder(pos:CGPoint){
        let boulder = SKSpriteNode(imageNamed: "boulder")
        boulder.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 87.5, height: 87.5))
        boulder.size = CGSize(width: 175, height: 175)
        boulder.position = pos
        boulder.physicsBody?.categoryBitMask = 8
        boulder.physicsBody?.contactTestBitMask = 2 | 4
        
        addChild(boulder)
        
    }
    func makeApple(){
        print(SettingsManager.shared.choice)
        apple.physicsBody = SKPhysicsBody(circleOfRadius: 30)
        apple.size = CGSize(width: 60, height: 60)
        apple.position = CGPoint(x: frame.midX, y: frame.midY+50)
        apple.physicsBody?.restitution = 0
        apple.physicsBody?.categoryBitMask = 2
        apple.physicsBody?.contactTestBitMask = 8
        
        
        addChild(apple)
        
        if (SettingsManager.shared.choice == 1){
            firstP = "apple"
            secondP = "apple2nd"
            thirdP = "apple3rd"
            fourthP = "apple4th"
        }else if (SettingsManager.shared.choice == 2){
            firstP = "pumpkin"
            secondP = "pumpkin2nd"
            thirdP = "pumpkin3rd"
            fourthP = "pumpkin4th"
        }
        apple.texture = SKTexture(imageNamed: firstP)
    }
override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            print("touch \(location)")
            if location.x > frame.midX{
                apple.physicsBody?.velocity = CGVector(dx: 350, dy: 0)
            }
            if location.x < frame.midX{
                apple.physicsBody?.velocity = CGVector(dx: -350, dy: 0)
            }
            if resetButton.contains(location){
                if resetButton.alpha == 1{
                    reset()
                }
            }
            if backButton.contains(location){
                let gameScene = MainMenuScene(size: self.size)
                gameScene.scaleMode = .aspectFill
                self.view?.presentScene(gameScene, transition: .doorsCloseHorizontal(withDuration: 0.5))
                livesNode.removeFromParent()
                backButton.removeFromParent()
                apple.removeFromParent()
                bottomB.removeFromParent()
                resetButton.removeFromParent()
                scoreNode.removeFromParent()
                highScoreNode.removeFromParent()
                reset()
                
            }
        }
    

    }
    func reset(){
        lives = 3
        apple.texture = SKTexture(imageNamed: firstP)
        livesNode.text = "Lives: \(lives)"
        score = 0
        scoreNode.text = "Score: \(score)"
        apple.position = CGPoint(x: frame.midX, y: frame.midY+50)
        resetButton.alpha = 0
        apple.size = CGSize(width: 60, height: 60)
        apple.zRotation = 0
        highScoreNode.text = "HighScore: \(highScore)"
//        if highScore < score{
//            DefaultsManager.saveToUserDefaults(highScore: score)
//            highScoreNode.text = "HighScore: \(score)"
//            score = 0
//        }
        

    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        apple.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
    }
    func didBegin(_ contact: SKPhysicsContact) {
        if contact.bodyA.categoryBitMask == 8 && contact.bodyB.categoryBitMask == 2 {
            // lose and crushed apple
            lives -= 1
            print("apple crushed")
            contact.bodyA.node?.removeFromParent()
            if lives > 0{
                livesNode.text = "Lives: \(lives)"
            }
            
            if lives == 2{
                apple.texture = SKTexture(imageNamed: secondP)
            }else if lives == 1{
                apple.texture = SKTexture(imageNamed: thirdP)
                apple.size = CGSize(width: 70, height: 60)
                
            }else if lives == 0{
                apple.size = CGSize(width: 80, height: 60)
                //figure out how to make oval
               
                apple.texture = SKTexture(imageNamed: fourthP)
                livesNode.text = "Last life!"
            }else if lives < 0{
                // play animation
                if score > highScore{
                    DefaultsManager.saveToUserDefaults(highScore: score)
                }
                livesNode.text = "GAME OVER"
                resetButton.alpha = 1
            }
            if contact.bodyA.categoryBitMask == 2 && contact.bodyB.categoryBitMask == 8 {
                // lose and crushed apple
                lives -= 1
                print("apple crushed")
                contact.bodyB.node?.removeFromParent()
                if lives > 0{
                    livesNode.text = "Lives: \(lives)"
                }
                
                if lives == 2{
                    apple.texture = SKTexture(imageNamed: secondP)
                }else if lives == 1{
                    apple.texture = SKTexture(imageNamed: thirdP)
                }else if lives == 0{
                    // play animation
                    apple.texture = SKTexture(imageNamed: fourthP)
                    livesNode.text = "Last life!"
                }else if lives < 0{
                    if score > highScore{
                        DefaultsManager.saveToUserDefaults(highScore: score)
                    }
                    
                    livesNode.text = "GAME OVER"
                    resetButton.alpha = 1
                }
                
                
            }
            //test
            
           
        }
        if contact.bodyA.categoryBitMask == 8 && contact.bodyB.categoryBitMask == 4 {
            print("Hit")
            contact.bodyA.node?.removeFromParent()
            score += 1
            scoreNode.text = "Score: \(score)"
        }
        if contact.bodyA.categoryBitMask == 4 && contact.bodyB.categoryBitMask == 8 {
            print("Hit")
            contact.bodyB.node?.removeFromParent()
            score += 1
            scoreNode.text = "Score: \(score)"
        }
    }
}
