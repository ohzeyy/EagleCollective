//
//  ConcertViewModel.swift
//  EagleCollective
//
//  Created by Zach Peter on 4/27/23.
//

import Foundation

class ConcertViewModel: ObservableObject {
    
    // Concert Info Hardcoded In
    
    let concerts: [Concert] = [Concert(index: 1, name: "Live @ Midway Cafe", artist: "Photo Negative", date: "4/5/23", time: "7:30pm"),
                               Concert(index: 2, name: "Demons in the Sky", artist: "SAANE", date: "4/29/23", time: "9:00pm")]
    
}
