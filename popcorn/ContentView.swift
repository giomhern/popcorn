//
//  ContentView.swift
//  popcorn
//
//  Created by Giovanni Maya on 8/4/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            MovieList()
                .tabItem {
                    Label("Movies", systemImage: "film.stack")
                }
            
            FriendList()
                .tabItem {
                    Label("Friends", systemImage: "person.and.person")
                }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(SampleData.shared.modelContainer)
}
