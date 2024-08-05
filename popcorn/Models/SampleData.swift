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
        
        do {
            try context.save()
        } catch {
            print("Sample data failed to save")
        }
    }
    
    var movie: Movie {
        Movie.sampleData[0]
    }
    
}
