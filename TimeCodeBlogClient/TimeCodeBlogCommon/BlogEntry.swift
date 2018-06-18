//
//  BlogEntry.swift
//  TimeCodeBlogClient
//
//  Created by Chris Adamson on 6/18/18.
//  Copyright © 2018 Subsequently & Furthermore, Inc. All rights reserved.
//

import Foundation

public struct BlogEntry: Codable {
    public let id: String
    public let url: URL
    public let title: String
    public let date_published: String
    public let date_modified: String
    public let authorDict: [String: String]

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case url = "url"
        case title = "title"
        case authorDict = "author"
        case date_published = "date_published"
        case date_modified = "date_modified"
    }
}
