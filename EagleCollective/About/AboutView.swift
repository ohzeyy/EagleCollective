//
//  AboutView.swift
//  EagleCollective
//
//  Created by Zach Peter on 4/27/23.
//

import SwiftUI

struct AboutView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var message = "Eagle Collective was started as a term-long project for Kristie Dickinson's (amazing) Design Thinking class. The assignment was to design a solution that:\n\n 1. Is for the BC community.\n 2. Is for a specific community you are a part of.\n3. Gives you genuine excitement!\n4. Is something YOU can affect.\n\nThus, the idea for a service that connects student-musicians and their peers was born. The Eagle Collective aims to make EVERY Boston College student aware of EVERY Boston College musician. I hope that the Collective continues to exist and thrive long after the Final Design Thinking Presentation is due.\n\nIn the few weeks since the last Design Thinking class, the Eagle Collective website has been translated into a fully functional and Spotify-integrated app. Now BC students can find and listen to their peers in as few taps as possible!  \n\n- Zach"
    
    private let email = "zachpeter10@gmail.com"
    
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
            
            ScrollView {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .padding(.horizontal, 100)
                
                Spacer()
                
                Text(message)
                    .padding(.horizontal)
                    .padding(.top)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .font(.title3)
                    .bold()
                    .shadow(radius: 1.5)
                
                Spacer()
                
                Link("Have any advice, suggestions, or comments?\nInterested in Getting Involved?\n CONTACT US!\n", destination: URL(string: "https://mail.google.com/mail/u/0/?fs=1&tf=cm&source=mailto&to=\(email)")!)
                    .fontWeight(.black)
                    .font(.title3)
                    .padding()
                
                Spacer()
                
                Button("BACK") {
                    dismiss()
                }
                .foregroundColor(.white)
                
            }
            .toolbarBackground(.hidden, for: .navigationBar)
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
