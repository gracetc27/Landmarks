//
//  BadgeIcon.swift
//  Landmarks
//
//  Created by Grace couch on 17/04/2024.
//

import SwiftUI

struct BadgeIcon: View {
    var body: some View {
        ZStack {
            MountainBottom()
                .fill(.gray)
                .stroke(.black, lineWidth: 4)
            MountainTop()
                .fill(Gradient(colors:[.white, .gray]))
                .stroke(.black, lineWidth: 4)
        }
    }
}


private struct MountainTop: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            let width = min(rect.size.width, rect.size.height)
            let height = width * 0.75
            let spacing = width * 0.030
            let middle = width * 0.5
            let topWidth = width * 0.226
            let topHeight = height * 0.488
            let yOffset = (rect.height - height) / 2.0


            path.addLines([
                CGPoint(x: middle, y: spacing + yOffset),
                CGPoint(x: middle - topWidth, y: topHeight - spacing + yOffset),
                CGPoint(x: middle, y: (topHeight / 2 + spacing) + yOffset),
                CGPoint(x: middle + topWidth, y: topHeight - spacing + yOffset),
                CGPoint(x: middle, y: spacing + yOffset)
            ])
        }
    }
}
    private struct MountainBottom: Shape {
        func path(in rect: CGRect) -> Path {
            Path { path in
                let width = min(rect.size.width, rect.size.height)
                let height = width * 0.75
                let spacing = width * 0.030
                let middle = width * 0.5
                let topWidth = width * 0.226
                let topHeight = height * 0.488
                let yOffset = (rect.height - height) / 2.0

                path.addLines([
                    CGPoint(x: middle - topWidth, y: topHeight + spacing + yOffset),
                    CGPoint(x: spacing, y: height - spacing + yOffset),
                    CGPoint(x: width - spacing, y: height - spacing + yOffset),
                    CGPoint(x: middle + topWidth, y: topHeight + spacing + yOffset),
                    CGPoint(x: middle, y: (topHeight / 2 + spacing * 3) + yOffset) ])
                path.closeSubpath()
            }
        }
    }
#Preview {
    BadgeIcon()
}
