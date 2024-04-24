//
//  CircleImage.swift
//  Landmarks
//
//  Created by Grace couch on 16/04/2024.
//

import SwiftUI

struct CircleImage: View {
    var image: Image

    var body: some View {
        image
            .clipShape(.circle)
            .overlay {
                Circle().stroke(lineWidth: 5)
            }
            .shadow(color: .gray, radius: 5)
    }
}

#Preview {
    CircleImage(image: Image("turtlerock"))
}
