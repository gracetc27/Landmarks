//
//  ProfileSummary.swift
//  Landmarks
//
//  Created by Grace couch on 19/04/2024.
//

import SwiftUI

struct ProfileSummary: View {
    @Environment(ModelData.self) var modelData
    var profile: Profile

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text(profile.username)
                    .bold()
                    .font(.title)

                Text("Notifications: \(profile.prefersNotifs ? "On" : "Off" )")
                Text("Seasonal Photos \(profile.seasonalPhoto.rawValue)")
                Text("Goal Date: ") + Text(profile.goalDate, style: .date)

                Divider()

                VStack(alignment: .leading) {
                    Text("Completed Badges:")
                        .font(.headline)

                    ScrollView(.horizontal) {
                        HStack {
                            HikeBadge(name: "First Hike", colors: [.brown, .green], color2: .green)
                            HikeBadge(name: "Earth Day", colors: [.blue, .white, .green], color2: .blue)
                            HikeBadge(name: "Tenth Hike", colors: [.red, .white, .red], color2: .red)
                        }
                        .padding(.bottom)
                    }
                }
                Divider()

                VStack(alignment: .leading) {
                    Text("Recent Hikes:")
                        .font(.headline)
                    HikeView(hike: modelData.hikes[0])
                }
            }
        }
    }
}

#Preview {
    ProfileSummary(profile: Profile.default)
        .environment(ModelData())
}
