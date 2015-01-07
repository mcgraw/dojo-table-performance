//
//  XMCFeedTableViewController.swift
//  dojo-table-performance
//
//  Created by David McGraw on 1/4/15.
//  Copyright (c) 2015 David McGraw. All rights reserved.
//

import UIKit

class XMCFeedTableViewController: UITableViewController {
    
    class var XMCDateFormatter : NSDateFormatter {
        struct Static {
            static let instance: NSDateFormatter = {
                let formatter = NSDateFormatter()
                formatter.dateFormat = "MM-dd-yy"
                return formatter
                }()
        }
        return Static.instance
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 360
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: XMCFeedTableViewCell = tableView.dequeueReusableCellWithIdentifier("dogItemId") as XMCFeedTableViewCell
        
        cell.updateWithRandomData()
        
        return cell
    }
    
}

