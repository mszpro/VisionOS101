//
//  AssetsLoading.swift
//  VisionOSDemo
//
//  Created by Msz on 8/21/24.
//

#if os(visionOS)

import Foundation
import RealityKit
import DemoAssets

@MainActor
func loadFromRealityComposerProject(nodeName: String? = nil, sceneFileName: String) async -> Entity? {
    var entity: Entity? = nil
    do {
        let scene = try await Entity(named: sceneFileName,
                                     in: demoAssetsBundle)
        if let nodeName {
            entity = scene.findEntity(named: nodeName)
        } else {
            entity = scene
        }
    } catch {
        print("Failed to load asset named \(nodeName) within the file \(sceneFileName)")
    }
    return entity
}

#endif
