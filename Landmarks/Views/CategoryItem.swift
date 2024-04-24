//
//  CategoryItem.swift
//  Landmarks
//
//  Created by Grace couch on 18/04/2024.
//

import SwiftUI

struct CategoryItem: View {

    var landmark: Landmark

    var body: some View {
        VStack(alignment: .leading) {
            landmark.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .clipShape(.rect(cornerRadius: 6))
            Text(landmark.name)
                .foregroundStyle(.primary)
                .font(.caption)
        }
    }
}

#Preview {
    CategoryItem(landmark: ModelData().landmarks[0])
}
