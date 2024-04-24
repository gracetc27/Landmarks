//
//  BadgeBackground.swift
//  Landmarks
//
//  Created by Grace couch on 17/04/2024.
//

import SwiftUI

struct BadgeBackground: View {
    let colors: [Color]
    let color2: Color

    var body: some View {
        ZStack {
            BadgeBackgroundShape()
                .fill(.linearGradient(colors: colors , startPoint: .top, endPoint: .bottom))
                .stroke(.black, lineWidth: 3)
            BadgeBackgroundShape()
                .inset(by: 40)
                .fill(color2).stroke(.black, lineWidth: 2)
                .clipped()
                .shadow(color: .black, radius: 7)

            }
        .aspectRatio(1, contentMode: .fit)
        }
    }

private struct BadgeBackgroundShape: InsettableShape {
    var insetAmount: CGFloat = 0

    func inset(by amount: CGFloat) -> BadgeBackgroundShape {
        var copy = self
        copy.insetAmount = amount
        return copy
    }
    
    typealias InsetShape = BadgeBackgroundShape

    func path(in rect: CGRect) -> Path {
        let rect = rect.insetBy(dx: insetAmount, dy: insetAmount)
        return Path { path in
            var width: CGFloat = min(rect.size.width, rect.size.height)
            let height = width
            let xScale: CGFloat = 0.832
            let xOffset = (width * (1.0 - xScale)) / 2.0 + insetAmount
            let yOffset = insetAmount
            width *= xScale
            path.move (to: CGPoint(
                x: width * 0.95 + xOffset,
                y: height * (0.20 + HexagonParameters.adjustment) + yOffset))

            HexagonParameters.segments.forEach { segment in
                path.addLine(
                    to: CGPoint(
                        x: width * segment.line.x + xOffset,
                        y: height * segment.line.y + yOffset
                    )
                )

                path.addQuadCurve(
                    to: CGPoint(
                        x: width * segment.curve.x + xOffset,
                        y: height * segment.curve.y + yOffset
                    ),
                    control: CGPoint(
                        x: width * segment.control.x + xOffset,
                        y: height * segment.control.y + yOffset
                    )
                )
            }
        }
    }
}



#Preview {
    BadgeBackground(colors: [.brown, .green], color2: .green)
}
