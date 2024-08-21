//
//  ContentModel.swift
//  VisionOSDemo
//
//  Created by Msz on 8/21/24.
//

import SwiftUI
import RealityKit

let contentSpaceOrigin = Entity()

@Observable
class ContentModel {
    
    var loaded3DAsset: Entity? = nil
    
    @MainActor
    func loadAssets() async {
        loaded3DAsset = await loadFromRealityComposerProject(nodeName: "robot_walk_idle",
                                                             sceneFileName: "robot_walk_idle.usdz")
        loaded3DAsset?.name = "robot_root_node"
        loaded3DAsset?.scale = .init(x: 0.05, y: 0.05, z: 0.05)
        loaded3DAsset?.position = .init(x: 0, y: 0, z: -3)
        
        guard let loaded3DAsset else {
            return
        }
        
        // animation
        if let firstAnimation = loaded3DAsset.availableAnimations.first {
            loaded3DAsset.playAnimation(firstAnimation.repeat(),
                                        transitionDuration: 0,
                                        startsPaused: false)
        }
        
        // allow tap
        loaded3DAsset.generateCollisionShapes(recursive: true)
        loaded3DAsset.components[InputTargetComponent.self] = InputTargetComponent(allowedInputTypes: .all)
        
        contentSpaceOrigin.addChild(loaded3DAsset)
    }
    
    func addRobotAtRandomPosition() {
        guard let loaded3DAsset else { return }
        // clone the already loaded robot node
        let newRobot = loaded3DAsset.clone(recursive: true)
        newRobot.name = "robot_root_node"
        newRobot.position = .init(x: Float.random(in: -2...2),
                                  y: Float.random(in: 0...2),
                                  z: Float.random(in: (-3)...(-2)))
        newRobot.scale = .init(x: 0.03, y: 0.03, z: 0.03)
        if let firstAnimation = newRobot.availableAnimations.first {
            newRobot.playAnimation(firstAnimation.repeat(),
                                        transitionDuration: 0,
                                        startsPaused: false)
        }
        newRobot.generateCollisionShapes(recursive: true)
        newRobot.components[InputTargetComponent.self] = InputTargetComponent(allowedInputTypes: .all)
        contentSpaceOrigin.addChild(newRobot)
    }
    
}
