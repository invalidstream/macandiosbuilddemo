//
//  BlogFeedReader.swift
//  TimeCodeBlogClientIOS
//
//  Created by Chris Adamson on 6/18/18.
//  Copyright © 2018 Subsequently & Furthermore, Inc. All rights reserved.
//

import Foundation

private let blogFeedReaderURLSession = URLSession(configuration: .default)

public func reloadBlog (completionHandler: @escaping (BlogFeed?, Error?) -> Void ) {
    
    let url = URL(string: "http://www.subfurther.com/blog/feed/json")!
    let dataTask = blogFeedReaderURLSession.dataTask(with: url)
    { dataOrNil, responseOrNil, errorOrNil in
        if let error = errorOrNil {
            completionHandler(nil, error)
            return
        }
        
        if let httpResponse = responseOrNil as? HTTPURLResponse,
            (200..<299).contains(httpResponse.statusCode),
            let data = dataOrNil  {
            
            let jsonDecoder = JSONDecoder()
            do {
                let feed = try jsonDecoder.decode(BlogFeed.self, from: data)
                completionHandler(feed, nil)
            } catch {
                print ("decode error: \(error)")
                completionHandler(nil, error)
            }
        } else {
            print ("something sucks. pleaes suck less.")
            //FIXME: handle non-200 responses, missing data
        }
    }
    dataTask.resume()
    
}
