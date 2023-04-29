//
//  ArtistDetailView.swift
//  EagleCollective
//
//  Created by Zach Peter on 4/26/23.
//

import SwiftUI

struct ArtistDetailView: View {
    var artist: Artist
    
    var body: some View {
        VStack {
            
            Text(artist.name)
            
            
            Spacer()
        }
    }
}

struct ArtistDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ArtistDetailView(artist: Artist(genres: ["hip hop", "rap"], images: [AlbumCover(url: "https://i.scdn.co/image/ab6761610000e5eb8278b782cbb5a3963db88ada", height: 100, width: 100)], name: "Tyler, the Creator", uri: "spotify:artist:4V8LLVI7PbaPR0K2TGSxFF"))
    }
}
