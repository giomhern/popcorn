//
//  Friend.swift
//  popcorn
//
//  Created by Giovanni Maya on 8/4/24.
//

import Foundation
import SwiftData

@Model
final class Friend {
    var name: String
    var favoriteMovie: Movie?
    
    init(name: String){
        self.name = name
    }
    
    static let sampleData = [
        Friend(name: "Chris"),
        Friend(name: "Juan"),
        Friend(name: "Brenda"),
        Friend(name: "Uli")
    ]
}
