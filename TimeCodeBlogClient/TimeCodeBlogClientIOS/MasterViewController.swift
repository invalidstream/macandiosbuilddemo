//
//  MasterViewController.swift
//  TimeCodeBlogClient
//
//  Created by Chris Adamson on 6/18/18.
//  Copyright © 2018 Subsequently & Furthermore, Inc. All rights reserved.
//

import UIKit
import TimeCodeBlogFrameworkIOS

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil

    var blogFeedViewModel: BlogFeedViewModel = {
        let model = BlogFeedViewModel()
        return model
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        navigationItem.leftBarButtonItem = editButtonItem

//        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(insertNewObject(_:)))
//        navigationItem.rightBarButtonItem = addButton
        if let split = splitViewController {
            let controllers = split.viewControllers
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
        
        blogFeedViewModel.delegate = self // wish I could do this in the lazy init
        blogFeedViewModel.reload()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let detail = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                detail.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                detail.navigationItem.leftItemsSupplementBackButton = true
                detail.blogEntry = blogFeedViewModel.blogs[indexPath.row]
            }
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return blogFeedViewModel.blogs.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BlogEntryCell", for: indexPath) as! BlogEntryTableViewCell

        cell.blogEntry = blogFeedViewModel.blogs[indexPath.row]

        return cell
    }

}

extension MasterViewController: BlogFeedPresenting {
    func blogFeedViewModelDidUpdate(_ model: BlogFeedViewModel) {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
