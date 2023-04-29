//
//  ArtistsListView.swift
//  EagleCollective
//
//  Created by Zach Peter on 4/26/23.
//

import SwiftUI

struct ArtistsListView: View {
    @Environment(\.dismiss) private var dismiss
    
    @StateObject var keyVM = KeyViewModel()
    @StateObject var artistsVM = ArtistViewModel()
    
    // Change idsString in artistsVM to determine what artist show
    
    var body: some View {
        NavigationStack {
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
                    ScrollView {
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                            .padding(.horizontal, 100)
                            .padding(.bottom)
                        NavigationStack {
                            ForEach(artistsVM.artistsArray, id: \.self)  { artist in
                                let artistURI = String("\(artist.uri)").dropFirst(15)
                                VStack {
                                    AsyncImage(url: URL(string: "\(artist.images[0].url)" )) { image in
                                        image
                                            .resizable()
                                            .scaledToFill()
                                    } placeholder: {
                                        Image(systemName: "photo.artframe")
                                            .foregroundColor(.white)
                                            .scaleEffect(4)
                                    }
                                    .frame(width: 335, height: 335)
                                    .clipped()
                                    
                                    
                                    Link(destination:
                                            URL(string: String("https://open.spotify.com/artist/\(artistURI)"))!) {
                                        HStack {
                                            
                                            Text(artist.name)
                                                .font(.title)
                                            
                                            
                                            Image(systemName: "link")
                                                .font(.headline)
                                            
                                            Spacer()
                                        }
                                        .fontWeight(.black)
                                        .frame(width: 335, alignment: .leading)
                                        .padding(.bottom, 40)
                                        
                                    }
                                            .foregroundColor(.white)
                                    
                                }
                            }
                            .navigationBarTitleDisplayMode(.automatic)
                            .navigationBarBackButtonHidden(true)
                            .toolbarBackground(.hidden, for: .navigationBar)
                        }
                        .task {
                            await artistsVM.getData()
                        }
                        
                        Button("BACK") {
                            dismiss()
                        }
                        .foregroundColor(.white)
                        
                    }
                    .scrollIndicators(.hidden)
                }
            }
        }
    }
        
        
}

struct ArtistsListView_Previews: PreviewProvider {
    static var previews: some View {
        ArtistsListView(keyVM: KeyViewModel(), artistsVM: ArtistViewModel())
    }
}
