//
//  ConcertView.swift
//  EagleCollective
//
//  Created by Zach Peter on 4/27/23.
//

import SwiftUI

struct ConcertView: View {
    @Environment(\.dismiss) private var dismiss
    
    @StateObject var concertVM = ConcertViewModel()
    
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
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(concertVM.concerts, id: \.self) { concert in
                            
                            VStack {
                                Image("concert\(concert.index)")
                                    .resizable()
                                    .scaledToFit()
                                    .clipped()
                                    .frame(width: 350, height: 350)
            
                                Text(concert.artist)
                                Text(concert.name)
                                Text("\(concert.date) @ \(concert.time)")
                            }
                            .font(.title2)
                            .lineLimit(1)
                            .foregroundColor(.white)
                            .fontWeight(.black)
        
                        }
                    }
                }
                
                Spacer()
                
                Button("BACK") {
                    dismiss()
                }
                .foregroundColor(.white)
            }
        }
    }
}

struct ConcertView_Previews: PreviewProvider {
    static var previews: some View {
        ConcertView()
    }
}
