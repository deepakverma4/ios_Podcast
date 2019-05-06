//
//  Podcast.swift
//  podCast
//
//  Created by prabhat pankaj on 15/03/19.
//  Copyright © 2019 learnix. All rights reserved.
//

import Foundation


struct Podcast: Decodable{
    var trackName: String?
    var artistName: String?
    var artworkUrl60: String?
    var trackCount: Int?
    var feedUrl: String?
}
