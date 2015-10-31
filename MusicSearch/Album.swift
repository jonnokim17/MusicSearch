//
//  Album.swift
//  MusicSearch
//
//  Created by Jonathan Kim on 10/30/15.
//  Copyright © 2015 Jonathan Kim. All rights reserved.
//

import UIKit

class Album: NSObject {

    var title: String
    var artist: String
    var genre: String
    var artWorkURL: String

    init(title: String, artist: String, genre: String, artWorkURL: String) {

        self.title = title
        self.artist = artist
        self.genre = genre
        self.artWorkURL = artWorkURL
    }
}
