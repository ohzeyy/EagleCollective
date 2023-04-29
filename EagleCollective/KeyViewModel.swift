//
//  KeyViewModel.swift
//  EagleCollective
//
//  Created by Zach Peter on 4/26/23.
//

import Foundation

class KeyViewModel: ObservableObject {
    
    private struct Returned: Codable {
        var access_token: String
        var token_type: String
    }
    
    @Published var access_token = ""
    @Published var token_type = ""
    
    func getData() async {
        
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
            guard let returned = try? JSONDecoder().decode(Returned.self, from: data) else {
                print("ERROR could not decode JSON data ")
                return
            }
            print("JSON returned!! Token type: \(returned.token_type), Access Token: \(returned.access_token)")
            
            // Decode into class properties
            self.access_token = returned.access_token
            self.token_type = returned.token_type
        }
        task.resume()

    }
}
