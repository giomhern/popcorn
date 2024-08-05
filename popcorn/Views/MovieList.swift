//
//  ContentView.swift
//  popcorn
//
//  Created by Giovanni Maya on 8/1/24.
//

import SwiftUI
import SwiftData

struct MovieList: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var movies: [Movie]
    @State private var newMovie: Movie?

    var body: some View {
        NavigationSplitView {
            Group {
                if !movies.isEmpty {
                    List {
                        ForEach(movies) { movie in
                            NavigationLink {
                                MovieDetail(movie: movie)
                            } label: {
                                Text(movie.title)
                            }
                        }
                        .onDelete(perform: deleteMovies)
                    }
                } else {
                    ContentUnavailableView{
                        Label("No movies found", systemImage: "film.stack")
                    }
                }
            }
            .navigationTitle("Movies")
#if os(macOS)
            .navigationSplitViewColumnWidth(min: 180, ideal: 200)
#endif
            .toolbar {
#if os(iOS)
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
#endif
                ToolbarItem {
                    Button(action: addMovie) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }.sheet(item: $newMovie){ movie in
                NavigationStack {
                    MovieDetail(movie: movie, isNew: true)
                }
                .interactiveDismissDisabled()
            }
        } detail: {
            Text("Select an movie")
                .navigationTitle("Movie")
        }
    }

    private func addMovie() {
        withAnimation {
            let newItem = Movie(title: "", releaseDate: .now)
            modelContext.insert(newItem)
            newMovie = newItem
        }
    }

    private func deleteMovies(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(movies[index])
            }
        }
    }
}

#Preview {
    MovieList()
        .modelContainer(SampleData.shared.modelContainer)
}

#Preview("No Movies View") {
    MovieList()
}

