//
//  BlogFeedViewModel.swift
//  TimeCodeBlogClientIOS
//
//  Created by Chris Adamson on 6/18/18.
//  Copyright © 2018 Subsequently & Furthermore, Inc. All rights reserved.
//

import Foundation

public class BlogFeedViewModel {

    public weak var delegate: BlogFeedPresenting?

    private var blogFeed: BlogFeed? {
        didSet {
            delegate?.blogFeedViewModelDidUpdate(self)
        }
    }

    public var blogs: [BlogEntry] {
        return blogFeed?.items ?? []
    }

    public init() {
    }

    public func reload() {
        reloadBlog() {[weak self] feedOrNil, errorOrNil in
            if let error = errorOrNil {
                print ("error: \(error)")
            }
        
            if let feed = feedOrNil, let strongSelf = self {
                strongSelf.blogFeed = feed
            }
        }
    }

}
