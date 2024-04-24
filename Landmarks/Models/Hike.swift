//
//  Hike.swift
//  Landmarks
//
//  Created by Grace couch on 18/04/2024.
//

import Foundation


struct Hike: Codable, Hashable, Identifiable {
    var id: Int
    var distance: Double
    var difficulty: Int
    var name: String
    var observations: [Observation]


    static var formatter = LengthFormatter()

    var distanceText: String {
        Hike.formatter.unitString(fromValue: distance, unit: .kilometer)
    }


    struct Observation: Codable, Hashable {
         var distanceFromStart: Double


         var elevation: Range<Double>
         var pace: Range<Double>
         var heartRate: Range<Double>
     }
}
