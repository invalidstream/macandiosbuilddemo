//
//  BlogEntryViewController.swift
//  TimeCodeBlogClientMac
//
//  Created by Chris Adamson on 6/18/18.
//  Copyright © 2018 Subsequently & Furthermore, Inc. All rights reserved.
//

import Cocoa
import WebKit
import TimeCodeBlogFrameworkMac

class BlogEntryViewController: NSViewController {

    var blogEntry: BlogEntry?
    
    @IBOutlet var webView: WKWebView!
    
    override func viewWillAppear() {
        super.viewWillAppear()
        if let url = blogEntry?.url {
            let request = URLRequest(url: url)
            webView.load(request)
        }

    }



}
