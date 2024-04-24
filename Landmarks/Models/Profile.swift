//
//  Profile.swift
//  Landmarks
//
//  Created by Grace couch on 19/04/2024.
//

import Foundation

struct Profile {
    var username: String
    var prefersNotifs = true
    var seasonalPhoto = Season.winter
    var goalDate = Date()


    static let `default` = Profile(username: "gtc27")

    enum Season: String, CaseIterable, Identifiable {
    case spring = "🌸"
    case summer = "☀️"
    case autumn = "🍂"
    case winter = "☃️"

        var id: String {rawValue}
    }
}
