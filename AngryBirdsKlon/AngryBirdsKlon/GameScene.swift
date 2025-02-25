//
//  GameScene.swift
//  AngryBirdsKlon
//
//  Created by Yasemin salan on 22.02.2025.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
 //var bird2 = SKSpriteNode()
    var bird = SKSpriteNode()
    var box1 = SKSpriteNode()
    var box2 =  SKSpriteNode()
    var box3 = SKSpriteNode()
    var box4 = SKSpriteNode()
    var box5 = SKSpriteNode()
    
    var gameStarted = false
    var originalPosition : CGPoint?
    
    var score = 0
    var scoreLabel = SKLabelNode()
    
    enum ColliderType: UInt32 {
        case Bird = 1
        case Box = 2
    }
    
    override func didMove(to view: SKView) {
       /* let texture = SKTexture(imageNamed: "bird")
        bird2 = SKSpriteNode(texture: texture)
        bird2.position = CGPoint(x: 0, y: 0)
        bird2.size = CGSize(width: self.frame.width / 16, height: self.frame.width / 10)
        bird2.zPosition = 1
        self.addChild(bird2)*/
        
        //ekranı total bir çerçeve oluşturuluyor yani kuş düştüğünde ekrandan kaybolmuyor
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        self.scene?.scaleMode = .aspectFit
        //contakları algılama opsiyonu var demek
        self.physicsWorld.contactDelegate = self
        
        //Bird
        bird = childNode(withName: "bird") as! SKSpriteNode
        let birdTexture = SKTexture(imageNamed: "bird")
        
        
        bird.physicsBody = SKPhysicsBody(circleOfRadius: birdTexture.size().height / 13)
        // vucudu yer çekiminden etkilenmesi için bu seçenek true yapılır
        bird.physicsBody?.affectedByGravity = false
        //fiziksel aktiviteleren etkilenip etkilenmeyeceği bilgisi
        bird.physicsBody?.isDynamic = true
        //kütlesi
        bird.physicsBody?.mass = 0.15
        originalPosition = bird.position
        //katagori tanımlandığında çakışma yaşandığında bildirim verir.
        //bird.physicsBody?.collisionBitMask = 1
        bird.physicsBody?.contactTestBitMask = ColliderType.Bird.rawValue
        bird.physicsBody?.categoryBitMask = ColliderType.Bird.rawValue
        bird.physicsBody?.collisionBitMask = ColliderType.Box.rawValue
        
        //Box
        let boxTexture = SKTexture(imageNamed: "brick")
        let size = CGSize(width: boxTexture.size().width / 6, height: boxTexture.size().height / 6)
        
        box1 = childNode(withName: "box1") as! SKSpriteNode
        box1.physicsBody = SKPhysicsBody(rectangleOf: size)
        box1.physicsBody?.isDynamic = true
        box1.physicsBody?.affectedByGravity = true
        //sağa sola dönebilme özelliği
        box1.physicsBody?.allowsRotation = true
        box1.physicsBody?.mass = 0.4
        box1.physicsBody?.collisionBitMask = ColliderType.Box.rawValue
        
        box2 = childNode(withName: "box2") as! SKSpriteNode
        box2.physicsBody = SKPhysicsBody(rectangleOf: size)
        box2.physicsBody?.isDynamic = true
        box2.physicsBody?.affectedByGravity = true
        //sağa sola dönebilme özelliği
        box2.physicsBody?.allowsRotation = true
        box2.physicsBody?.mass = 0.4
        box2.physicsBody?.collisionBitMask = ColliderType.Box.rawValue
        
        box3 = childNode(withName: "box3") as! SKSpriteNode
        box3.physicsBody = SKPhysicsBody(rectangleOf: size)
        box3.physicsBody?.isDynamic = true
        box3.physicsBody?.affectedByGravity = true
        //sağa sola dönebilme özelliği
        box3.physicsBody?.allowsRotation = true
        box3.physicsBody?.mass = 0.4
        box3.physicsBody?.collisionBitMask = ColliderType.Box.rawValue
        
        box4 = childNode(withName: "box4") as! SKSpriteNode
        box4.physicsBody = SKPhysicsBody(rectangleOf: size)
        box4.physicsBody?.isDynamic = true
        box4.physicsBody?.affectedByGravity = true
        //sağa sola dönebilme özelliği
        box4.physicsBody?.allowsRotation = true
        box4.physicsBody?.mass = 0.4
        box4.physicsBody?.collisionBitMask = ColliderType.Box.rawValue
        
        box5 = childNode(withName: "box5") as! SKSpriteNode
        box5.physicsBody = SKPhysicsBody(rectangleOf: size)
        box5.physicsBody?.isDynamic = true
        box5.physicsBody?.affectedByGravity = true
        //sağa sola dönebilme özelliği
        box5.physicsBody?.allowsRotation = true
        box5.physicsBody?.mass = 0.4
        box5.physicsBody?.collisionBitMask = ColliderType.Box.rawValue
        
        //Label
        scoreLabel.fontName = "Helvetica"
        scoreLabel.fontSize = 60
        scoreLabel.text = "0"
        scoreLabel.position = CGPoint(x: 0, y: self.frame.height / 4)
        scoreLabel.zPosition = 2
        self.addChild(scoreLabel)
        
        
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        if contact.bodyA.collisionBitMask == ColliderType.Bird.rawValue || contact.bodyB.collisionBitMask == ColliderType.Bird.rawValue {
            
            score += 1
            scoreLabel.text = String(score)
            
        }
    }
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
       
    }
    
    func touchUp(atPoint pos : CGPoint) {
       
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //kullanıcı ekrana dokunmaya başladı
        
        //kuşun uçurulması işlemleri
        /*bird.physicsBody?.applyImpulse(CGVector(dx: 50, dy: 100))
        bird.physicsBody?.affectedByGravity = true*/
        if gameStarted == false {
            if let toutch = touches.first {
                let touchLocation = toutch.location(in: self)
                
               let touchNodes = self.nodes(at: touchLocation)
                
                if touchNodes.isEmpty == false {
                    for node in touchNodes {
                        
                        if let  sprite = node as? SKSpriteNode {
                            if sprite == bird {
                                bird.position = touchLocation
                            }
                        }
                       
                    }
                }
            }
        }
    
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
       //kullanıcı elini oynatı
        if gameStarted == false {
            if let toutch = touches.first {
                let touchLocation = toutch.location(in: self)
                
               let touchNodes = self.nodes(at: touchLocation)
                
                if touchNodes.isEmpty == false {
                    for node in touchNodes {
                        
                        if let  sprite = node as? SKSpriteNode {
                            if sprite == bird {
                                bird.position = touchLocation
                            }
                        }
                       
                    }
                }
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
       //kullanıcı dokunmayı bitirdi
        
        if gameStarted == false {
            if let toutch = touches.first {
                let touchLocation = toutch.location(in: self)
                
               let touchNodes = self.nodes(at: touchLocation)
                
                if touchNodes.isEmpty == false {
                    for node in touchNodes {
                        
                        if let  sprite = node as? SKSpriteNode {
                            if sprite == bird {
                                let dx = -(touchLocation.x-originalPosition!.x)
                                let dy = -(touchLocation.y-originalPosition!.y)
                                
                                let impulse = CGVector(dx: dx, dy: dy)
                                
                                bird.physicsBody?.applyImpulse(impulse)
                                bird.physicsBody?.affectedByGravity = true
                                
                                gameStarted = true
                                
                            }
                        }
                       
                    }
                }
            }
        }
        
     
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        //kullanıcı dokunmaktan vazgeçti
       
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        
        if let birdPhysicsBody = bird.physicsBody {
            
            if birdPhysicsBody.velocity.dx <= 0.1 && birdPhysicsBody.velocity.dy <= 0.1 && birdPhysicsBody.angularVelocity <= 0.1 && gameStarted == true {
                
                
                bird.physicsBody?.affectedByGravity = false
                bird.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
                bird.physicsBody?.angularVelocity = 0
                bird.zPosition = 1
                bird.position = originalPosition!
                
                
                //score = 0
                //scoreLabel.text = String(score)
                
                gameStarted = false
                
                
            }
            
        }
    }
}
