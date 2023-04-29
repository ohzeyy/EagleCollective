//
//  Albums.swift
//  EagleCollective
//
//  Created by Zach Peter on 4/28/23.
//

import Foundation

struct Albums: Codable, Identifiable, Hashable {
    var id = UUID().uuidString
    
    var items: [Item]
    
    enum CodingKeys: CodingKey {
        case items
    }
}
