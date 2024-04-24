//
//  Badge.swift
//  Landmarks
//
//  Created by Grace couch on 17/04/2024.
//

import SwiftUI

struct Badge: View {
    let colors: [Color]
    let color2: Color
    var body: some View {
        ZStack(alignment: .center) {
            BadgeBackground(colors: colors, color2: color2)
            BadgeIcon()
                .scaleEffect(0.55)
                .offset(y: -25)
                .shadow(color: .black, radius: 5, x: 3, y: -1)
        }
        .aspectRatio(contentMode: .fit)
    }
}

#Preview {
    Badge(colors: [.brown, .green], color2: .green)
}
