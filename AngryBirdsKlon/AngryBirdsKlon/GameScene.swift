//
//  GameScene.swift
//  AngryBirdsKlon
//
//  Created by Yasemin salan on 22.02.2025.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
 var bird2 = SKSpriteNode()
    
    override func didMove(to view: SKView) {
       /* let texture = SKTexture(imageNamed: "bird")
        bird2 = SKSpriteNode(texture: texture)
        bird2.position = CGPoint(x: 0, y: 0)
        bird2.size = CGSize(width: self.frame.width / 16, height: self.frame.width / 10)
        bird2.zPosition = 1
        self.addChild(bird2)*/
        
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
       
    }
    
    func touchUp(atPoint pos : CGPoint) {
       
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //kullanıcı ekrana dokunmaya başladı
    
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
       //kullanıcı elini oynatı
       
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
       //kullanıcı dokunmayı bitirdi
     
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        //kullanıcı dokunmaktan vazgeçti
       
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
