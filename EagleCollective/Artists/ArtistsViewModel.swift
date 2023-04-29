//
//  ArtistsViewModel.swift
//  EagleCollective
//
//  Created by Zach Peter on 4/26/23.
//

import Foundation

@MainActor

class ArtistViewModel: ObservableObject {
    
    // Process to get array of multiple artists
    
    struct Returned: Codable {
        var artists: [Artist]
    }
    
    @Published var artistsArray: [Artist] = []
    
    // CONTROL ARTISTS HERE
    
    private var idsString = "3uVOl76LEZ3U2pqz6hD9K7,2T7S2zN2V264cwSW4BwcXs,1UIM3CUAc8rKZ9MCxqNqy7,2FLqlgckDKdmpBrvLAT5BM"
    
    func getData() async {
        await getKey()
        let key = "\(self.token_type) \(self.access_token)"
        
        var request = URLRequest(url: URL(string: "https://api.spotify.com/v1/artists?ids=\(idsString)")!,timeoutInterval: Double.infinity)
        
        //TODO: change this to take ids from artistIDS
        // var request = URLRequest(url: URL(string: "https://api.spotify.com/v1/artists?ids=\(ids)")!,timeoutInterval: Double.infinity)
        
        //TODO: change this to be authorization from keyVM (uncomment the below)
        // request.addValue("\(key)", forHTTPHeaderField: "Authorization")
        
        request.addValue("Bearer BQCA0IBxTQNkJEk-jHY6g3zkYuow8bB4bAdwtsNbsnLBYlm44JGmlAXfg8v1P2r67bVcKwkVhr9QkmuPsFOCFKD9Fdm65ok-49qwfQaZTbQ1rVNP-fvR", forHTTPHeaderField: "Authorization")
        
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            print(String(data: data, encoding: .utf8)!)
            
            // Decode JSON into our Returned data structure
            guard let returned = try? JSONDecoder().decode(Returned.self, from: data) else {
                print("ERROR could not decode JSON data ")
                return
            }
            print("JSON returned!! \(returned.artists[0].name) <- this is the first artist, \(returned.artists[1].name) <- this is the second artist")
            
            // Decode into class properties
            self.artistsArray = returned.artists
        }
        task.resume()
    }
    
    
    // Process to get auth key (same as KeyViewModel)
    
    private struct keyReturned: Codable {
        var access_token: String
        var token_type: String
    }
    
    @Published var access_token = ""
    @Published var token_type = ""
    
    func getKey() async {
        
        // Postman Code
        let parameters = "client_id=519b45e53566433a8b8c2d89c19394a8&client_secret=a25b3eef228240c39ff14559165e275b&grant_type=client_credentials"
        let postData =  parameters.data(using: .utf8)
        
        var request = URLRequest(url: URL(string: "https://accounts.spotify.com/api/token")!,timeoutInterval: Double.infinity)
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.addValue("__Host-device_id=AQAk8zXKgL-qqX7UqDm6t-4_20LytFGUF1PiZsMxwtbj77ZWkWSvq-Ojf175RL9LBzxyr7dQvtaSH9WPfSf5EYuS-8B_Vq7Hyd8; sp_tr=false", forHTTPHeaderField: "Cookie")
        
        request.httpMethod = "POST"
        request.httpBody = postData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            print(String(data: data, encoding: .utf8)!)
            
            // Decode JSON into our Returned data structure
            guard let key_returned = try? JSONDecoder().decode(keyReturned.self, from: data) else {
                print("ERROR could not decode JSON data ")
                return
            }
            print("JSON returned!! Token type: \(key_returned.token_type), Access Token: \(key_returned.access_token)")
            
            // Decode into class properties
            self.access_token = key_returned.access_token
            self.token_type = key_returned.token_type
        }
        task.resume()
    }
}




