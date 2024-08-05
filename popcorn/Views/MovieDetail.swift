//
//  MovieDetail.swift
//  popcorn
//
//  Created by Giovanni Maya on 8/1/24.
//

import SwiftUI

struct MovieDetail: View {
    @Bindable var movie: Movie
    
    var body: some View {
        Form {
            TextField("Movie title", text: $movie.title)
            DatePicker("Release data", selection: $movie.releaseDate, displayedComponents: .date)
        }
        .navigationTitle("Movie")
    }
}

#Preview {
    NavigationStack {
        MovieDetail(movie: SampleData.shared.movie)
    }
}
