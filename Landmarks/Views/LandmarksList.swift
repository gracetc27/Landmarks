//
//  LandmarksList.swift
//  Landmarks
//
//  Created by Grace couch on 16/04/2024.
//

import SwiftUI

struct LandmarksList: View {
    @Environment(ModelData.self) var modelData
    @State private var showFavoritesOnly = false

    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }

    var body: some View {
        NavigationSplitView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites")
                }
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .animation(.default, value: showFavoritesOnly)
                .navigationTitle("Landmarks")
            } detail: {
                Text("Select a Landmark")
            }
        }
    }

#Preview {
    LandmarksList()
        .environment(ModelData())
}
