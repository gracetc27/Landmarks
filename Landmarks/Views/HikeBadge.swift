//
//  HikeBadge.swift
//  Landmarks
//
//  Created by Grace couch on 19/04/2024.
//

import SwiftUI

struct HikeBadge: View {
    var name: String
    let colors: [Color]
    let color2: Color

    var body: some View {
        VStack(alignment: .center) {
            Badge(colors: colors, color2: color2)
                .frame(width: 300, height: 300)
                .scaleEffect(1.0 / 3.0)
                .frame(width: 100, height: 100)
            Text(name)
                .font(.caption)
                .accessibilityLabel("Badge for \(name)")

        }
    }
}

#Preview {
    HikeBadge(name: "Preview Test", colors: [.brown, .green], color2: .green)
}
