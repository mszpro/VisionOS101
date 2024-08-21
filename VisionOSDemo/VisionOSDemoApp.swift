//
//  VisionOSDemoApp.swift
//  VisionOSDemo
//
//  Created by Msz on 8/21/24.
//

import SwiftUI
import RealityKit

struct ARModelOpenParameter: Identifiable, Hashable, Codable {
    var id: String {
        return "\(modelName)-\(modelNodeName)"
    }
    var modelName: String
    var modelNodeName: String
    var initialScale: Float
}

@main
struct VisionOSDemoApp: App {
    
    @State private var gameModel = ContentModel()
    
    @Environment(\.dismissWindow) private var dismissWindow
    
    var body: some SwiftUI.Scene {
        
        WindowGroup {
            ContentView()
                .environment(gameModel)
        }
        .windowStyle(.plain)
        
        ImmersiveSpace(id: "robotSpace") {
            ContentSpace()
                .environment(gameModel)
        }
        
        WindowGroup(for: ARModelOpenParameter.self) { $object in
            // 3D view
            if let object {
                RealityView { content in
                    guard let arAsset = await loadFromRealityComposerProject(
                        nodeName: object.modelNodeName,
                        sceneFileName: object.modelName
                    ) else {
                        fatalError("Unable to load beam from Reality Composer Pro project.")
                    }
                    arAsset.generateCollisionShapes(recursive: true)
                    arAsset.position = .init(x: 0, y: 0, z: 0)
                    arAsset.scale = .init(x: object.initialScale,
                                          y: object.initialScale,
                                          z: object.initialScale)
                    arAsset.components[InputTargetComponent.self] = InputTargetComponent(allowedInputTypes: .all)
                    content.add(arAsset)
                }
                .dragRotation()
                .frame(width: 900, height: 900)
                .glassBackgroundEffect(displayMode: .always)
            }
        }
        .windowStyle(.volumetric)
        .defaultSize(width: 0.5, height: 0.5, depth: 0.5, in: .meters)
        
    }
    
}
