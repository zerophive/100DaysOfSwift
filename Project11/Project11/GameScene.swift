//
//  GameScene.swift
//  Project11
//
//  Created by oaccamsrazor on 11.4.2019.
//  Copyright © 2019 oaccamsrazor. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
	var scoreLabel: SKLabelNode!
	var score = 0 {
		didSet {
			scoreLabel.text = "Score: \(score)"
		}
	}
	
	var editLabel: SKLabelNode!
	var editingMode: Bool = false {
		didSet {
			if editingMode {
				editLabel.text = "Done"
			} else {
				editLabel.text = "Edit"
			}
		}
	}
	
	var ballsLabel: SKLabelNode!
	var balls = 5 {
		didSet {
			ballsLabel.text = "Balls: \(balls)"
		}
	}
	
	let ballColors: [String] = ["Blue", "Cyan", "Green", "Grey", "Purple", "Red", "Yellow"]
	var boxes = [SKNode]()
	
	// MARKER: - SKScene overrides
    override func didMove(to view: SKView) {
		let background = SKSpriteNode(imageNamed: "background")
		background.position = CGPoint(x: 512, y: 384)
		background.blendMode = .replace
		background.zPosition = -1
		addChild(background)
		
		scoreLabel = SKLabelNode(fontNamed: "Chalkduster")
		scoreLabel.text = "Score: 0"
		scoreLabel.horizontalAlignmentMode = .right
		scoreLabel.position = CGPoint(x: 980, y: 700)
		addChild(scoreLabel)
		
		editLabel = SKLabelNode(fontNamed: "Chalkduster")
		editLabel.text = "Edit"
		editLabel.position = CGPoint(x: 80, y: 700)
		addChild(editLabel)
		
		ballsLabel = SKLabelNode(fontNamed: "Chalkduster")
		ballsLabel.text = "Balls: 5"
		ballsLabel.horizontalAlignmentMode = .center
		ballsLabel.position = CGPoint(x: 512, y: 700)
		addChild(ballsLabel)
		
		physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
		
		physicsWorld.contactDelegate = self

		makeSlot(at: CGPoint(x: 128, y: 0), isGood: true)
		makeSlot(at: CGPoint(x: 384, y: 0), isGood: false)
		makeSlot(at: CGPoint(x: 640, y: 0), isGood: true)
		makeSlot(at: CGPoint(x: 896, y: 0), isGood: false)

		makeBouncer(at: CGPoint(x: 0, y: 0))
		makeBouncer(at: CGPoint(x: 256, y: 0))
		makeBouncer(at: CGPoint(x: 512, y: 0))
		makeBouncer(at: CGPoint(x: 768, y: 0))
		makeBouncer(at: CGPoint(x: 1024, y: 0))
    }
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		guard let touch = touches.first else { return }
		let location = touch.location(in: self)
		let objects = nodes(at: location)
		
		if objects.contains(editLabel) {
			editingMode.toggle()
		} else {
			if editingMode {
				let size = CGSize(width: Int.random(in: 16...128), height: 16)
				let box = SKSpriteNode(color: UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1), size: size)
				box.zRotation = CGFloat.random(in: 0...3)
				box.position = location
				box.physicsBody = SKPhysicsBody(rectangleOf: box.size)
				box.physicsBody?.isDynamic = false
				box.name = "box"
				boxes.append(box)
				addChild(box)
			} else if balls > 0 {
				balls -= 1
				let ballColor = "ball\(ballColors.randomElement() ?? "ballRed")"
				let ball = SKSpriteNode(imageNamed: ballColor)
				ball.physicsBody = SKPhysicsBody(circleOfRadius: ball.size.width / 2.0)
				ball.physicsBody?.restitution = 0.4
				ball.physicsBody?.contactTestBitMask = ball.physicsBody?.collisionBitMask ?? 0
				ball.position = CGPoint(x: location.x, y: frame.maxY)
				ball.name = "ball"
				addChild(ball)
			}
		}
	}
	
	// MARKER: SKPhysicsContactDelegate methods
	func didBegin(_ contact: SKPhysicsContact) {
		guard let nodeA = contact.bodyA.node else { return }
		guard let nodeB = contact.bodyB.node else { return }
		
		if nodeA.name == "ball" {
			collision(between: nodeA, object: nodeB)
		} else if nodeB.name == "ball" {
			collision(between: nodeB, object: nodeA)
		}
	}
	
	// MARKER: - methods
	func makeBouncer(at position: CGPoint) {
		let bouncer = SKSpriteNode(imageNamed: "bouncer")
		bouncer.position = position
		bouncer.physicsBody = SKPhysicsBody(circleOfRadius: bouncer.size.width / 2.0)
		bouncer.physicsBody?.isDynamic = false
		addChild(bouncer)
	}
	
	func makeSlot(at position: CGPoint, isGood: Bool) {
		var slotBase: SKSpriteNode
		var slotGlow: SKSpriteNode
		
		if isGood {
			slotBase = SKSpriteNode(imageNamed: "slotBaseGood")
			slotGlow = SKSpriteNode(imageNamed: "slotGlowGood")
			slotBase.name = "good"
		} else {
			slotBase = SKSpriteNode(imageNamed: "slotBaseBad")
			slotGlow = SKSpriteNode(imageNamed: "slotGlowBad")
			slotBase.name = "bad"
		}
		
		slotBase.position = position
		slotGlow.position = position
		
		slotBase.physicsBody = SKPhysicsBody(rectangleOf: slotBase.size)
		slotBase.physicsBody?.isDynamic = false
		
		addChild(slotBase)
		addChild(slotGlow)
		
		let spin = SKAction.rotate(byAngle: .pi, duration: 10)
		let spinForever = SKAction.repeatForever(spin)
		slotGlow.run(spinForever)
	}
	
	func collision(between ball: SKNode, object: SKNode) {
		if object.name == "good" {
			destroy(ball: ball)
			score += 1
			balls += 1
		} else if object.name == "bad" {
			destroy(ball: ball)
			score -= 1
			if balls <= 0 {
				if childNode(withName: "ball") == nil {
					gameOver()
				}
			}
		} else if object.name == "box" {
			destroy(ball: object)
		}
	}
	
	func destroy(ball: SKNode) {
		if let fireParticles = SKEmitterNode(fileNamed: "FireParticles") {
			fireParticles.position = ball.position
			addChild(fireParticles)
		}
		ball.removeFromParent()
	}
	
	func gameOver() {
		let ac = UIAlertController(title: "Game Over!", message: nil, preferredStyle: .alert)
		ac.addAction(UIAlertAction(title: "Play Again", style: .default) { [weak self] _ in
			self?.balls = 5
			self?.score = 0
			if let boxes = self?.boxes  {
				for box in boxes {
					box.removeFromParent()
				}
			}
			self?.boxes.removeAll()
		})
		view?.window?.rootViewController?.present(ac, animated: true)
	}
}