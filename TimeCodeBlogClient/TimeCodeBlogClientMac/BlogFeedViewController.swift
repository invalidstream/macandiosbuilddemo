//
//  ViewController.swift
//  TimeCodeBlogClientMac
//
//  Created by Chris Adamson on 6/18/18.
//  Copyright © 2018 Subsequently & Furthermore, Inc. All rights reserved.
//

import Cocoa
import TimeCodeBlogFrameworkMac

class BlogFeedViewController: NSViewController {

    @IBOutlet var tableView: NSTableView!
    
    var blogFeedViewModel: BlogFeedViewModel = {
        let model = BlogFeedViewModel()
        return model
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        blogFeedViewModel.delegate = self // wish I could do this in the lazy init
        blogFeedViewModel.reload()
        
        tableView.doubleAction =  #selector(handleDoubleAction)
        
    }

    @objc func handleDoubleAction() {
        let storyboard = NSStoryboard(name: "Main", bundle: nil)
        let blogEntryWindow = storyboard.instantiateController(withIdentifier: "BlogEntryWindow") as! NSWindowController
        let blogEntryViewController = blogEntryWindow.contentViewController as! BlogEntryViewController
        if tableView.selectedRow > -1 {
            let blogEntry = blogFeedViewModel.blogs[tableView.selectedRow]
            blogEntryViewController.blogEntry = blogEntry
        }
        blogEntryWindow.showWindow(self)
    }


    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

}

extension BlogFeedViewController: NSTableViewDataSource {
    func numberOfRows(in tableView: NSTableView) -> Int {
        return blogFeedViewModel.blogs.count
    }

    func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
        return blogFeedViewModel.blogs[row]
    }
}

extension BlogFeedViewController: BlogFeedPresenting {
    func blogFeedViewModelDidUpdate(_ model: BlogFeedViewModel) {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
