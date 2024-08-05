//
//  MovieDetail.swift
//  popcorn
//
//  Created by Giovanni Maya on 8/1/24.
//

import SwiftUI

struct MovieDetail: View {
    @Bindable var movie: Movie
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    let isNew: Bool
    
    init(movie: Movie, isNew: Bool = false) {
        self.movie = movie
        self.isNew = isNew
    }
    
    var sortedFriends: [Friend]{
        movie.favoritedBy.sorted { first, second in
            first.name < second.name
        }
    }
    
    var body: some View {
        Form {
            TextField("Movie title", text: $movie.title)
            DatePicker("Release data", selection: $movie.releaseDate, displayedComponents: .date)
            
            if !movie.favoritedBy.isEmpty {
                Section("Favorited By"){
                    ForEach(sortedFriends){ friend in
                        Text(friend.name)
                    }
                }
            }
        }
        .navigationTitle(isNew ? "New movie": "Movie")
        .toolbar {
            if isNew {
                ToolbarItem(placement: .confirmationAction){
                    Button("Done") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .cancellationAction){
                    Button("Cancel"){
                        modelContext.delete(movie)
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        MovieDetail(movie: SampleData.shared.movie)
    }
    .modelContainer(SampleData.shared.modelContainer)
}

#Preview("New Movie") {
    NavigationStack {
        MovieDetail(movie: SampleData.shared.movie, isNew: true)
            .navigationBarTitleDisplayMode(.inline)
    }
    .modelContainer(SampleData.shared.modelContainer)
}
