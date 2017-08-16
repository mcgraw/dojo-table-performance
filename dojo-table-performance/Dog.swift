//
//  Dog.swift
//  dojo-table-performance
//
//  Created by David McGraw on 1/4/15.
//  Copyright (c) 2015 David McGraw. All rights reserved.
//

import UIKit

class Dog: NSObject {
   
    var name: NSString?
   
    var title: NSString?
    
    var date: Int?
    
    var liked = false
    
    // Date using an NSDateFormatter object
    func randomFormatterDate() -> NSString {
        let date = randomUnixDate()
        let formatter = DateFormatter()
        formatter.dateStyle = DateFormatter.Style.long
        return formatter.string(from: date) as NSString
    }
    
    // Between Jan 1 2011 and Jan 1 2015
    func randomUnixDate() -> Date {
        let interval: TimeInterval = Double((arc4random() % UInt32((1420070400 - 1293840000)))) + 1293840000
         return Date(timeIntervalSince1970: interval)
    }
    
}
