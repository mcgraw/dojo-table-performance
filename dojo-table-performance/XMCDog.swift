//
//  XMCDog.swift
//  dojo-table-performance
//
//  Created by David McGraw on 1/4/15.
//  Copyright (c) 2015 David McGraw. All rights reserved.
//

import UIKit

class XMCDog: NSObject {
   
    var name: NSString?
    var title: NSString?
    var date: Int?
    
    var liked = false
    
    
    // Date using an NSDateFormatter object
    func randomFormatterDate() -> NSString {
        let date = randomUnixDate()
        let formatter = NSDateFormatter()
        formatter.dateStyle = NSDateFormatterStyle.LongStyle
        return formatter.stringFromDate(date)
    }
    
    // Between Jan 1 2011 and Jan 1 2015
    func randomUnixDate() -> NSDate {
        let interval: NSTimeInterval = Double((arc4random() % UInt32((1420070400 - 1293840000)))) + 1293840000
         return NSDate(timeIntervalSince1970: interval)
    }
}
