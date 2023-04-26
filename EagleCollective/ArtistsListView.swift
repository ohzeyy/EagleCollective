//
//  ArtistsListView.swift
//  EagleCollective
//
//  Created by Zach Peter on 4/26/23.
//

import SwiftUI

struct ArtistsListView: View {
    @StateObject var artistsVM = ArtistViewModel()
    
    @State private var artistIDs = ["4V8LLVI7PbaPR0K2TGSxFF", "0TnOYISbd1XYRBk9myaseg"]
    
    // Placeholder data
    // @State private var artists = ["Photo Negative", "SAANE", "CARAMEL", "Eric Nam"]
    
    var body: some View {
        NavigationStack {
//            var key = "\(artistsVM.token_type) \(artistsVM.access_token)"
//            var id = "0TnOYISbd1XYRBk9myaseg"
            Text("\(artistsVM.name)")
                .task {
                    await artistsVM.getArtistData(key: "Bearer BQAkQ2OCNy5n2RyPHz3wjqzpQFlQZlRyEdcujQltQbxZcBwUBhd85YeD2btU05eeQ7s8W_C4rYXwtMCFiPJeHakEKflLlTfywXT0_QUN0BEpzLIGKuAC", id: "4V8LLVI7PbaPR0K2TGSxFF")
                    
                }
            Text("\(artistsVM.name)")
            
            
            
            List {
                ForEach(artistsVM.artistsArray, id: \.self) { artist in
                    Text(artist.name)
                }
            }
        }
        .task {
            await artistsVM.getAuthKey()

            ForEach(artistIDs, id: \.self) { artistID in
                await artistsVM.getArtistData(key: "Bearer BQAkQ2OCNy5n2RyPHz3wjqzpQFlQZlRyEdcujQltQbxZcBwUBhd85YeD2btU05eeQ7s8W_C4rYXwtMCFiPJeHakEKflLlTfywXT0_QUN0BEpzLIGKuAC", id: artistID)
            }
        }
    }
}

func getData() {
    
}

struct ArtistsListView_Previews: PreviewProvider {
    static var previews: some View {
        ArtistsListView()
    }
}
