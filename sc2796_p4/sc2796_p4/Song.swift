//
//  Song.swift
//  sc2796_p4
//
//  Created by Steven Chen on 10/22/21.
//

import Foundation
import UIKit

class Song {
    var name: String
    var artist: String
    var album: String
    var albumCover: UIImage!
    
    init(name: String, artist: String, album: String, albumCover: UIImage) {
        self.name = name
        self.artist = artist
        self.album = album
        self.albumCover = albumCover
    }
}
