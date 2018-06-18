//
//  BlogEntryTableViewCell.swift
//  TimeCodeBlogClientIOS
//
//  Created by Chris Adamson on 6/18/18.
//  Copyright © 2018 Subsequently & Furthermore, Inc. All rights reserved.
//

import UIKit
import TimeCodeBlogFrameworkIOS

class BlogEntryTableViewCell: UITableViewCell {


    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var authorLabel: UILabel!
    @IBOutlet private var dateLabel: UILabel!
    
    var blogEntry: BlogEntry? {
        didSet {
            titleLabel.text = blogEntry?.title
            authorLabel.text = blogEntry?.authorDict["name"]
            dateLabel.text = blogEntry?.date_published
        }
    }
    

}
