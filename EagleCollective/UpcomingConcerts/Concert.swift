//
//  Concert.swift
//  EagleCollective
//
//  Created by Zach Peter on 4/27/23.
//

import Foundation

struct Concert: Codable, Hashable {
    var index: Int
    var name: String
    var artist: String
    var date: String
    var time: String
}
