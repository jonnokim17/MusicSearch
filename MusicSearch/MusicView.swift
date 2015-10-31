//
//  MusicView.swift
//  MusicSearch
//
//  Created by Jonathan Kim on 10/30/15.
//  Copyright © 2015 Jonathan Kim. All rights reserved.
//

import UIKit

class MusicView: UIView {

    @IBOutlet var artworkImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var artistLabel: UILabel!
    @IBOutlet var genreLabel: UILabel!

    func addDataToMusicView(album: Album) {
//        artworkImageView.image = UIImage(data: NSData(contentsOfURL: NSURL(string: album.artWorkURL)!)!)

        let imageURL = NSURL(string: album.artWorkURL)

        if let imageURL = imageURL {
            let imageData = NSData(contentsOfURL: imageURL)
            if let imageData = imageData {
                artworkImageView.image = UIImage(data: imageData)
            }
        }

        titleLabel.text = album.title
        artistLabel.text = album.artist
        genreLabel.text = album.genre
    }

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
