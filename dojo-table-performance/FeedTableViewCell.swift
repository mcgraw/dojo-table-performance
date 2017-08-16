//
//  FeedTableViewCell.swift
//  dojo-table-performance
//
//  Created by David McGraw on 1/4/15.
//  Copyright (c) 2015 David McGraw. All rights reserved.
//

import UIKit
import PINRemoteImage

class FeedTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets

    @IBOutlet weak var dogPhoto: UIImageView!
    
    @IBOutlet weak var dogName: UILabel!
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var date: UILabel!
    
    @IBOutlet weak var likeAction: UIButton!
    
    
    // MARK: - Public Methods
    
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
        // Make sure you really need attributed strings
        
        loadAttributedText()
        
//        loadPlainText()
        
    }
    
    /**
     Loads a photo from a remote source
    */
    func loadPhoto() {
        
        let r = (arc4random() % UInt32(20))
        if let data = try? Data(contentsOf: URL(string: "http://www.xmcgraw.com/pets/jpg/siberian\(r).jpg")!) {
            dogPhoto.image = UIImage(data: data)
        }
        
    }
    
    /**
     Loads a photo on a background thread
    */
    func loadPhotoAsync() {
        
        DispatchQueue.global(qos: .background).async {
            
            let r = (arc4random() % UInt32(20))
            if let data = try? Data(contentsOf: URL(string: "http://www.xmcgraw.com/pets/jpg/siberian\(r).jpg")!) {
                DispatchQueue.main.async {
                    self.dogPhoto.image = UIImage(data: data)
                }
            }
            
        }
        
    }
    
    /**
     Loads a photo from `PINRemoteImage`
    */
    func loadPhotoWithCache() {
        
        let r = (arc4random() % UInt32(20))
        if let url = URL(string: "http://www.xmcgraw.com/pets/jpg/siberian\(r).jpg") {
            dogPhoto.pin_setImage(from: url)
        }
        
    }
    
    /**
     Sets a date as MM-dd-yy leveraging a `DateFormatter`
     
     Warning: these are not threadsafe so you will need to create a static formatter
     on each thread
    */
    func loadDate() {
        
        // Warning: these are not threadsafe so you need to create a static formatter
        // on each thread
        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd-yy"
        date.text = formatter.string(from: Date())
        
    }
    
    /**
     Set date using a static formatter
     
     Warning: these are not threadsafe so you will need to create a static formatter
     on each thread
    */
    func loadDataStaticFormatter() {
        date.text = FeedTableViewController.XMCDateFormatter.string(from: Date())
    }
    
    /**
     Set the name and title using attributed strings
    */
    func loadAttributedText() {
        
        var attributed = NSMutableAttributedString(string: "Calix")
        attributed.addAttribute(NSFontAttributeName, value: UIFont.systemFont(ofSize: 16.0), range: NSMakeRange(0, attributed.length))
        dogName.attributedText = attributed
        
        attributed = NSMutableAttributedString(string: "Silly Dog")
        attributed.addAttribute(NSFontAttributeName, value: UIFont.systemFont(ofSize: 22.0), range: NSMakeRange(0, attributed.length))
        title.attributedText = attributed
        
    }
    
    /**
     Set the name and title using plain text
    */
    func loadPlainText() {
        
        dogName.text = "Calix"
        title.text = "Silly Dog"
        
    }
}
