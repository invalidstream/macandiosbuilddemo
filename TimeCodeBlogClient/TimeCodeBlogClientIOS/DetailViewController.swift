//
//  DetailViewController.swift
//  TimeCodeBlogClient
//
//  Created by Chris Adamson on 6/18/18.
//  Copyright © 2018 Subsequently & Furthermore, Inc. All rights reserved.
//

import UIKit
import WebKit
import TimeCodeBlogFrameworkIOS

class DetailViewController: UIViewController {

    var blogEntry: BlogEntry?

    @IBOutlet var webView: WKWebView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let url = blogEntry?.url {
            let request = URLRequest(url: url)
            webView.load(request)
        }


    }

}

