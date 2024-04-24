//
//  CatagoriesHome.swift
//  Landmarks
//
//  Created by Grace couch on 18/04/2024.
//

import SwiftUI

struct CatagoriesHome: View {
    @Environment(ModelData.self) var modelData
    @State private var showingProfile = false
    @State private var currentPage = 0

    var body: some View {
        NavigationSplitView {
            List {
                ZStack(alignment: .bottomTrailing) {
                    TabView(selection: $currentPage) {
                        ForEach(Array(modelData.features.enumerated()), id: \.element.id) { (index, landmark) in
                            FeatureCard(landmark: landmark)
                                .tag(index)
                        }
                    }
                    .aspectRatio(3 / 2, contentMode: .fit)
                    .tabViewStyle(.page(indexDisplayMode: .never))
                    PageControl2(numberOfPages: modelData.features.count, currentPage: $currentPage)
                }
                .listRowInsets(EdgeInsets())
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
                .contentMargins(12)
            }
            .listStyle(.inset)
            .navigationTitle("Featured")
            .toolbar {
                Button {
                    showingProfile.toggle()
                } label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                }
            }
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
                    .environment(modelData)
            }
        } detail: {
            Text ("Select a Landmark")
        }
    }
}


#Preview {
    CatagoriesHome()
        .environment(ModelData())

}
