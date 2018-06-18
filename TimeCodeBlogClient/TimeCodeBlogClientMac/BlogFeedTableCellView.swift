//
//  BlogEntryTableCellView.swift
//  TimeCodeBlogClientMac
//
//  Created by Chris Adamson on 6/18/18.
//  Copyright © 2018 Subsequently & Furthermore, Inc. All rights reserved.
//

import Cocoa
import TimeCodeBlogFrameworkMac

class BlogFeedTableCellView: NSTableCellView {

    @IBOutlet var titleLabel: NSTextField!
    @IBOutlet var authorLabel: NSTextField!
    @IBOutlet var dateLabel: NSTextField!
    
    override var objectValue: Any? {
        didSet {
            guard let blogEntry = objectValue as? BlogEntry else { return }
            titleLabel.stringValue = blogEntry.title
            authorLabel.stringValue = blogEntry.authorDict["name"] ?? "Unknown"
            dateLabel.stringValue = blogEntry.date_published
        }
    }
    
}
