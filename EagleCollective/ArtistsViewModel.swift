//
//  ArtistsViewModel.swift
//  EagleCollective
//
//  Created by Zach Peter on 4/26/23.
//

import Foundation

class ArtistViewModel: ObservableObject {
    
    // Process to obtain authorization
    private struct authReturned: Codable {
        var access_token: String
        var token_type: String
    }
    
    @Published var access_token = ""
    @Published var token_type = ""
    
    // Code from Postman
    func getAuthKey() async {
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
            guard let auth_returned = try? JSONDecoder().decode(authReturned.self, from: data) else {
                print("ERROR: could not decode returned JSON data")
                return
            }
            // decode JSON into class's properties
            self.access_token = auth_returned.access_token
            self.token_type = auth_returned.token_type
        }
    
        task.resume()
    }
    
    // Process to obtain Artist Info using artist IDs
    private struct artistReturned: Codable {
        var genres: [String]
        var images: [Image]
        var name: String
        var uri: String
    }
    
    struct Image: Codable, Hashable {
        var url: String
    }
    
    @Published var genres: [String] = []
    @Published var images: [Image] = []
    @Published var name = ""
    @Published var uri = ""
    
    func getArtistData(key: String, id: String) async {
        
        // Code from Postman
        var request = URLRequest(url: URL(string: "https://api.spotify.com/v1/artists/\(id)")!,timeoutInterval: Double.infinity)
        request.addValue(key, forHTTPHeaderField: "Authorization")

        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
          print(String(data: data, encoding: .utf8)!)
            guard let artist_returned = try? JSONDecoder().decode(artistReturned.self, from: data) else {
                print("ERROR: could not decode returned JSON data")
                return
            }
            // decode JSON into class's properties
            self.genres = artist_returned.genres
            self.images = artist_returned.images
            self.name = artist_returned.name
            self.uri = artist_returned.uri
        }

        task.resume()

        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    // Code from class
    
    private struct Returned: Codable {
        // need key values we want to retrieve
        var count: Int
        var next: String
        // spelled exactly the same as whats in browser
        var results: [Result]
    }
    
    struct Result: Codable, Hashable {
        var name: String
        var url: String
        
    }
    
    @Published var urlString = ""
    @Published var count = 0
    @Published var artistsArray: [Result] = []
    
    func getData() async {
        print("We are accessing the url \(urlString)")
        
        // Create a URL
        guard let url = URL(string: urlString) else {
            print("Error could not create URL from \(urlString)")
            return
        }
        
        // Make call to URLSession Shared Data method with new url
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            // try to decode JSON into our own data structures
            guard let returned = try? JSONDecoder().decode(Returned.self, from: data) else {
                print("ERROR: could not decode returned JSON data")
                return
            }
            print("JSON SUCCESSFULLY DECODED: count = \(returned.count), next = \(returned.next)")
            
            // decode JSON into class's properties
            self.count = returned.count
            self.urlString = returned.next
            self.artistsArray = returned.results
            
        } catch {
            print("ERROR: could not get data from \(urlString)")
        }
    }
}




