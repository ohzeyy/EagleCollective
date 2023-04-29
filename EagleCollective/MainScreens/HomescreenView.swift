//
//  ContentView.swift
//  EagleCollective
//
//  Created by Zach Peter on 4/25/23.
//

import SwiftUI
import Firebase

struct HomescreenView: View {
    @Environment(\.dismiss) private var dismiss
    
    private let email = "zachpeter10@gmail.com"
    
    var body: some View {
        NavigationView {
            ZStack {
                
                Color.clear
                    .ignoresSafeArea()
                    .background(
                        Image("non-blurry")
                            .resizable()
                            .scaledToFill()
                            .ignoresSafeArea()
                    )
                
                ScrollView {
                    VStack {
                        
                        HStack {
                            Button {
                                do {
                                    try Auth.auth().signOut()
                                    print("🪵➡️ Log out successful!")
                                    dismiss()
                                } catch {
                                    print("😡 ERROR: Could not sign out!")
                                }
                            } label: {
                                Image(systemName: "arrow.left.to.line.compact")
                            }
                            .font(.subheadline)
                            .fontWeight(.black)
                            .tint(.white.opacity(0.7))
                            .padding(.horizontal, 4)
                            
                            Spacer()
                            
                            Link("CONTACT", destination: URL(string: "https://mail.google.com/mail/u/0/?fs=1&tf=cm&source=mailto&to=\(email)")!)
                                .fontWeight(.black)
                                .padding(.horizontal, 4)
                                .tint(.white.opacity(0.7))
                                .font(.caption)
                        }
                        .padding(.horizontal)
                        
                        Spacer()
                        
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                            .padding(.horizontal, 18)
                        
                        Spacer()
                        
                        VStack {
                            NavigationLink(destination: ArtistsListView()) {
                                Text("NEW RELEASES")
                                    .fontWeight(.black)
                                    .padding()
                                    .padding(.top, 10)
                            }
                            
                            NavigationLink(destination: ConcertView()) {
                                Text("UPCOMING CONCERTS")
                                    .fontWeight(.black)
                                    .padding()
                            }
                            
                            NavigationLink(destination: SpotifyPlaylistView()) {
                                Text("SPOTIFY PLAYLIST")
                                    .fontWeight(.black)
                                    .padding()
                            }
                            
                            NavigationLink(destination: ArtistsListView()) {
                                Text("SONGS")
                                    .fontWeight(.black)
                                    .padding()
                            }
                            
                            NavigationLink(destination: ArtistsListView()) {
                                Text("ARTISTS")
                                    .fontWeight(.black)
                                    .padding()
                            }
                            
                            NavigationLink(destination: AboutView()) {
                                Text("ABOUT")
                                    .fontWeight(.black)
                                    .padding()
                            }
                            
                            Button("MORE FEATURES COMING SOON") {
                                // TODO: ADD THOSE DAMN FEATURES
                            }
                            .minimumScaleFactor(0.1)
                            .lineLimit(1)
                            .padding(.top)
                            .padding(.horizontal, 40)
                            
                        }
                        .font(.title)
                        .foregroundColor(.white)
                        
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomescreenView()
    }
}
