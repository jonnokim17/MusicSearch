//
//  iTunesConnection.swift
//  MusicSearch
//
//  Created by Jonathan Kim on 10/30/15.
//  Copyright © 2015 Jonathan Kim. All rights reserved.
//

import UIKit

class iTunesConnection: NSObject {
    class func getAlbumForString(searchString: String, completionHandler:(Album) -> ()) {

        let escapedString = searchString.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLHostAllowedCharacterSet())

        let url = NSURL(string: "https://itunes.apple.com/search?term=\(escapedString!)&media=music")

        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            if error == nil {
                let itunesDict = try? NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
                if let itunesDict = itunesDict {

                    let resultsArray = itunesDict["results"] as! [Dictionary<String, AnyObject>]

                    if resultsArray.count > 0 {
                        if let resultsDict = resultsArray.first {
                            let artist = resultsDict["artistName"] as! String
                            let artWorkURL = resultsDict["artworkUrl100"] as! String
                            let albumTitle = resultsDict["collectionName"] as! String
                            let genre = resultsDict["primaryGenreName"] as! String

                            let album = Album(title: albumTitle, artist: artist, genre: genre, artWorkURL: artWorkURL)

                            completionHandler(album)
                        }
                    }
                }
            }
        }

        task.resume()
    }
}
