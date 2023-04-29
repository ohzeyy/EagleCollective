//
//  SpotifyPlaylistView.swift
//  EagleCollective
//
//  Created by Zach Peter on 4/27/23.
//

import SwiftUI

struct SpotifyPlaylistView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            Color.clear
                .ignoresSafeArea()
                .background(
                    Image("blurry")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                )
            
            VStack {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .padding(.horizontal, 100)
                
                Spacer()
                
                Link(destination: URL(string: "https://open.spotify.com/playlist/5ijfetELg0MM9xiNNMidY3?si=f2e5df0d32ff4dc9")!, label: {
                    VStack {
                        Image("spotify")
                            .resizable()
                            .scaledToFit()
                            .border(.white)
                            .shadow(radius: 1)
                        
                        Text("TAP TO GO TO SPOTIFY")
                            .underline()
                            .padding()
                    }
                    
                })
                    .fontWeight(.black)
                    .font(.title3)
                    .padding()
                
                Spacer()
                
                Spacer()
                
                Button("BACK") {
                    dismiss()
                }
                .foregroundColor(.white)
            }
        }
    }
}

struct SpotifyPlaylistView_Previews: PreviewProvider {
    static var previews: some View {
        SpotifyPlaylistView()
    }
}
