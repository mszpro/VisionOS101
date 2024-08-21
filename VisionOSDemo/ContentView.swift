//
//  ContentView.swift
//  VisionOSDemo
//
//  Created by Msz on 8/21/24.
//

import SwiftUI
import RealityKit

struct ContentView: View {
    
    @State private var showGlassBackground: Bool = true
    
    @Environment(ContentModel.self) var gameModel
    @Environment(\.openImmersiveSpace) private var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace
    
    @Environment(\.openWindow) private var openWindow
    
    var body: some View {
        
        VStack {
            
            Image(systemName: "swift")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .foregroundStyle(.tint)
            
            Text("I love SwiftUI! From MszPro.")
                .font(.largeTitle)
                .bold()
            
            Toggle("Show glass background", isOn: $showGlassBackground)
            
            Button("Open immersive space") {
                Task { @MainActor in
                    await self.dismissImmersiveSpace()
                    await self.gameModel.loadAssets()
                    await self.openImmersiveSpace(id: "robotSpace")
                }
            }
            
            Button("Add random robot in room") {
                self.gameModel.addRobotAtRandomPosition()
                speak(text: "ハロー")
            }
            
            Button("Hide robot") {
                Task { @MainActor in
                    await self.dismissImmersiveSpace()
                }
            }
            
            Button("Inspect robot in a window") {
                self.openWindow(value: ARModelOpenParameter(modelName: "robot_walk_idle.usdz", modelNodeName: "robot_walk_idle", initialScale: 0.01))
            }
            
        }
        .padding()
        .frame(width: 700)
        .glassBackgroundEffect(displayMode: showGlassBackground ? .always : .never)
        
    }
    
}

#Preview {
    ContentView()
}
