//
//  FriendDetail.swift
//  popcorn
//
//  Created by Giovanni Maya on 8/4/24.
//

import SwiftUI
import SwiftData

struct FriendDetail: View {
    @Bindable var friend: Friend
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    let isNew: Bool
    @Query(sort: \Movie.title) private var movies: [Movie]
    
    init(friend: Friend, isNew: Bool = false) {
        self.friend = friend
        self.isNew = isNew
    }
    
    var body: some View {
        Form {
            TextField("Name", text: $friend.name)
                .autocorrectionDisabled()
            
            Picker("Favorite Movie", selection: $friend.favoriteMovie){
                ForEach(movies){ movie in
                    Text("None")
                        .tag(nil as Movie?)
                    Text(movie.title)
                        .tag(movie as Movie?)
                    
                }
            }
        }
        .navigationTitle(isNew ? "New friend": "Friend")
        .toolbar {
            if isNew {
                ToolbarItem(placement: .cancellationAction){
                    Button("Cancel"){
                        modelContext.delete(friend)
                        dismiss()
                    }
                }
                ToolbarItem {
                    Button("Done"){
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack{
        FriendDetail(friend: SampleData.shared.friend)
    }.modelContainer(SampleData.shared.modelContainer)
    
}


#Preview("New Friend"){
    NavigationStack{
        FriendDetail(friend: SampleData.shared.friend, isNew: true)
            .navigationBarTitleDisplayMode(.inline)
    }.modelContainer(SampleData.shared.modelContainer)
}
