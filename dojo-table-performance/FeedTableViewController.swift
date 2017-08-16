//
//  FeedTableViewController.swift
//  dojo-table-performance
//
//  Created by David McGraw on 1/4/15.
//  Copyright (c) 2015 David McGraw. All rights reserved.
//

import UIKit

class FeedTableViewController: UITableViewController {
    
    class var XMCDateFormatter : DateFormatter {
        
        struct Static {
            
            static let instance: DateFormatter = {
                let formatter = DateFormatter()
                formatter.dateFormat = "MM-dd-yy"
                return formatter
                }()
            
        }
        return Static.instance
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 360
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: FeedTableViewCell = tableView.dequeueReusableCell(withIdentifier: "dogItemId") as! FeedTableViewCell
        
        cell.updateWithRandomData()
        
        return cell
    }
    
}

