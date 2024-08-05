//
//  Item.swift
//  popcorn
//
//  Created by Giovanni Maya on 8/1/24.
//

import Foundation
import SwiftData

@Model
final class Movie {
    var title: String
    var releaseDate: Date
    var favoritedBy = [Friend]()
    
    init(title: String, releaseDate: Date) {
        self.title = title
        self.releaseDate = releaseDate
    }
    
    static let sampleData = [
        Movie(title: "Amusing Space Traveler", releaseDate: Date(timeIntervalSinceReferenceDate: -402_000_000)),
        Movie(title: "Difficult Cat", releaseDate: Date(timeIntervalSinceReferenceDate: 120_000_000)),
        Movie(title: "Electrifying Trek", releaseDate: Date(timeIntervalSinceReferenceDate: -20_000_000)),
        Movie(title: "Reckless Train Ride 2", releaseDate: Date(timeIntervalSinceReferenceDate: 300_000_000))
    ]
    
    
    
}
