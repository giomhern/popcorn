//
//  SampleData.swift
//  popcorn
//
//  Created by Giovanni Maya on 8/1/24.
//

import Foundation
import SwiftData

@MainActor
class SampleData {
    static let shared = SampleData() // belongs to the class itself and not an individual instance
    let modelContainer: ModelContainer
    
    
    var context: ModelContext {
        modelContainer.mainContext
    }
    
    private init(){ // set to private to only be created within this class
        let schema = Schema([
            Movie.self,
            Friend.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)

        do {
            modelContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])
            insertSampleData()
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }
    
    func insertSampleData() {
        for movie in Movie.sampleData {
            context.insert(movie)
        }
        
        for friend in Friend.sampleData {
            context.insert(friend)
        }
        
        Friend.sampleData[0].favoriteMovie = Movie.sampleData[1]
        Friend.sampleData[2].favoriteMovie = Movie.sampleData[0]
        Friend.sampleData[1].favoriteMovie = Movie.sampleData[1]
        Friend.sampleData[3].favoriteMovie = Movie.sampleData[2]
        
        do {
            try context.save()
        } catch {
            print("Sample data failed to save")
        }
    }
    
    var movie: Movie {
        Movie.sampleData[0]
    }
    
    var friend: Friend {
        Friend.sampleData[0]
    }
    
}
