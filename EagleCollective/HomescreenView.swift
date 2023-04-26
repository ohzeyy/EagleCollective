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
                
                HStack {
                    Button("SIGN OUT") {
                        do {
                            try Auth.auth().signOut()
                            print("🪵➡️ Log out successful!")
                            dismiss()
                        } catch {
                            print("😡 ERROR: Could not sign out!")
                        }
                    }
                    .font(.caption)
                    .fontWeight(.black)
                    .tint(.white.opacity(0.75))
                    .padding(.horizontal, 4)
                    
                    Spacer()
                }
                .padding(.horizontal)
                
                Spacer()
                
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .padding(.horizontal)
                
                Group {
                    Button("NEW RELEASES") {
                        // TODO: add view
                    }
                    .fontWeight(.black)
                    .padding()
                    
                    Button("UPCOMING CONCERTS") {
                        // TODO: add view
                    }
                    .fontWeight(.black)
                    .padding()
                    
                    Button("SPOTIFY PLAYLIST") {
                        // TODO: add view
                    }
                    .fontWeight(.black)
                    .padding()
                    
                    Button("SONGS") {
                        // TODO: add view
                    }
                    .fontWeight(.black)
                    .padding()
                    
                    Button("ARTISTS") {
                        // TODO: add view
                    }
                    .fontWeight(.black)
                    .padding()
                    
                    Button("ABOUT") {
                        // TODO: add view
                    }
                    .fontWeight(.black)
                    .padding()
                    
                    Button("CONTACT") {
                        // TODO: add view
                    }
                    .fontWeight(.black)
                    .padding()
                }
                .font(.title)
                .tint(.white.opacity(0.95))
                
                Spacer()
            }
        }
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomescreenView()
    }
}
