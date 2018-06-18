//
//  BlogFeed.swift
//  TimeCodeBlogClient
//
//  Created by Chris Adamson on 6/18/18.
//  Copyright © 2018 Subsequently & Furthermore, Inc. All rights reserved.
//

import Foundation

public struct BlogFeed: Codable {
    let items: [BlogEntry]
}
