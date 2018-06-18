//
//  BlogFeedPresenting.swift
//  TimeCodeBlogFrameworkIOS
//
//  Created by Chris Adamson on 6/18/18.
//  Copyright © 2018 Subsequently & Furthermore, Inc. All rights reserved.
//

import Foundation

public protocol BlogFeedPresenting: class {
    func blogFeedViewModelDidUpdate(_ model: BlogFeedViewModel)
}
