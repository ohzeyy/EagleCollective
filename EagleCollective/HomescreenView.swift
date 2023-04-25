//
//  ContentView.swift
//  EagleCollective
//
//  Created by Zach Peter on 4/25/23.
//

import SwiftUI

struct HomescreenView: View {
    var body: some View {
        ZStack {
            
            Color.clear
                .ignoresSafeArea()
                .background(
                    Image("non-blurry")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                )
            
            VStack {
                
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .padding()
                
                Group {
                    Button("NEW RELEASES") {
                        // TODO: add view
                    }
                    .fontWeight(.black)
                    .tint(.white)
                    .padding()
                    
                    Button("UPCOMING CONCERTS") {
                        // TODO: add view
                    }
                    .fontWeight(.black)
                    .tint(.white)
                    .padding()
                    
                    Button("SPOTIFY PLAYLIST") {
                        // TODO: add view
                    }
                    .fontWeight(.black)
                    .tint(.white)
                    .padding()
                    
                    Button("SONGS") {
                        // TODO: add view
                    }
                    .fontWeight(.black)
                    .tint(.white)
                    .padding()
                    
                    Button("ARTISTS") {
                        // TODO: add view
                    }
                    .fontWeight(.black)
                    .tint(.white)
                    .padding()
                    
                    Button("ABOUT") {
                        // TODO: add view
                    }
                    .fontWeight(.black)
                    .tint(.white)
                    .padding()
                    
                    Button("CONTACT") {
                        // TODO: add view
                    }
                    .fontWeight(.black)
                    .tint(.white)
                    .padding()
                }
                .font(.title)

            }
            .padding()
            
                
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomescreenView()
    }
}
