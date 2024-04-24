//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Grace couch on 16/04/2024.
//

import SwiftUI

@main
struct LandmarksApp: App {
    
    @State private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
    }
}
