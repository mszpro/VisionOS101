//
//  ContentSpace.swift
//  VisionOSDemo
//
//  Created by Msz on 8/21/24.
//

#if os(visionOS)

import SwiftUI
import RealityKit

struct ContentSpace: View {
    
    @Environment(ContentModel.self) var gameModel
    
    var body: some View {
        
        RealityView { content in
            content.add(contentSpaceOrigin)
        }
        .gesture(TapGesture()
            .targetedToAnyEntity()
            .onEnded({ tap in
                let tappedNode = tap.entity
                // look up until it reaches the robot main node
                var foundRobotMainNode: Entity? = tappedNode
                while foundRobotMainNode != nil &&
                        foundRobotMainNode?.parent != nil {
                    if foundRobotMainNode?.name == "robot_root_node" {
                        break // we found it!
                    } else {
                        foundRobotMainNode = foundRobotMainNode?.parent
                    }
                }
                foundRobotMainNode?.removeFromParent()
                speak(text: "まだね")
            }))
        
    }
    
}

#Preview {
    ContentSpace()
}

#endif
