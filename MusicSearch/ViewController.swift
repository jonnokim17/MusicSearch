//
//  ViewController.swift
//  MusicSearch
//
//  Created by Jonathan Kim on 10/30/15.
//  Copyright © 2015 Jonathan Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var pageIndicator: UIPageControl!

    var numberOfItems = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        pageIndicator.numberOfPages = 0

        scrollView.delegate = self
    }
    
    @IBAction func searchForMusic(sender: AnyObject) {
        searchTextField.resignFirstResponder()

        self.numberOfItems++
        self.pageIndicator.numberOfPages = self.numberOfItems

        if searchTextField.text != "" {
            iTunesConnection.getAlbumForString(searchTextField.text!) { (album: Album) -> () in

                self.scrollView.contentSize = CGSizeMake(CGFloat(self.numberOfItems) * self.scrollView.frame.size.width, self.scrollView.frame.size.height)

                let musicView = NSBundle.mainBundle().loadNibNamed("MusicView", owner: self, options: nil)[0] as! MusicView
                musicView.frame = CGRectMake(CGFloat(self.numberOfItems - 1) * self.scrollView.frame.size.width, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height)
                musicView.updateConstraints()

                dispatch_async(dispatch_get_main_queue()) {
                    musicView.addDataToMusicView(album)
                    self.scrollView.addSubview(musicView)

                    self.scrollView.scrollRectToVisible(musicView.frame, animated: true)
                }
            }
        }
    }

    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let page = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageIndicator.currentPage = page
    }
}

