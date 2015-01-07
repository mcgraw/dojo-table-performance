//
//  XMCFeedTableViewCell.swift
//  dojo-table-performance
//
//  Created by David McGraw on 1/4/15.
//  Copyright (c) 2015 David McGraw. All rights reserved.
//

import UIKit

class XMCFeedTableViewCell: UITableViewCell {

    @IBOutlet weak var dogPhoto: UIImageView!
    
    @IBOutlet weak var dogName: UILabel!
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var date: UILabel!
    
    @IBOutlet weak var likeAction: UIButton!
        
    func updateWithRandomData() {
        
        // *****
        // Photo
        // Try out various methods for loading a photo, from worst to best
        
        loadPhoto()
        
//        loadPhotoAsync()
        
//        loadPhotoWithCache()
        
        // ****
        // Date
        // Constantly initializing formatters may not show a negative impact
        // right away visually, but it will add up eventually. Also, look at
        // the memory.
        
        loadDate()
        
//        loadDataStaticFormatter()
        
        // ****************
        // Dog name & Title
        // Make sure you really need attributed strings or not. 
        
        loadAttributedText()
        
//        loadPlainText()
        
    }
    
    // MARK: Photo Handling
    
    func loadPhoto() {
        let r = (arc4random() % UInt32(20))
        if let data = NSData(contentsOfURL: NSURL(string: "http://www.xmcgraw.com/pets/jpg/siberian\(r).jpg")!) {
            dogPhoto.image = UIImage(data: data)
        }
    }
    
    func loadPhotoAsync() {
        let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
        dispatch_async(dispatch_get_global_queue(priority, 0)) {
            let r = (arc4random() % UInt32(20))
            if let data = NSData(contentsOfURL: NSURL(string: "http://www.xmcgraw.com/pets/jpg/siberian\(r).jpg")!) {
                dispatch_async(dispatch_get_main_queue()) {
                    self.dogPhoto.image = UIImage(data: data)
                }
            }
        }
    }
    
    func loadPhotoWithCache() {
        let r = (arc4random() % UInt32(20))
        if let url = NSURL(string: "http://www.xmcgraw.com/pets/jpg/siberian\(r).jpg") {
            dogPhoto.hnk_setImageFromURL(url)
        }
    }
    
    // MARK: Date Handling
    
    func loadDate() {
        // Warning: these are not threadsafe so you need to create a static formatter
        // on each thread
        let formatter = NSDateFormatter()
        formatter.dateFormat = "MM-dd-yy"
        date.text = formatter.stringFromDate(NSDate())
    }
    
    func loadDataStaticFormatter() {
        // Warning: these are not threadsafe so you will need to create a static formatter
        // on each thread
        date.text = XMCFeedTableViewController.XMCDateFormatter.stringFromDate(NSDate())
    }
    
    // MARK: Text Handling
    
    func loadAttributedText() {
        var attributed = NSMutableAttributedString(string: "Calix")
        attributed.addAttribute(NSFontAttributeName, value: UIFont.systemFontOfSize(16.0), range: NSMakeRange(0, attributed.length))
        dogName.attributedText = attributed
        
        attributed = NSMutableAttributedString(string: "Silly Dog")
        attributed.addAttribute(NSFontAttributeName, value: UIFont.systemFontOfSize(22.0), range: NSMakeRange(0, attributed.length))
        title.attributedText = attributed
    }
    
    func loadPlainText() {
        dogName.text = "Calix"
        title.text = "Silly Dog"
    }
}
