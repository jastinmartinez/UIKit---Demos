//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Jastin Martínez on 20/11/22.
//

import Foundation

enum LoadFeedResult {
    case success([FeedItem])
    case error(Error)
}

protocol FeedLoader {
    func load(completion: (LoadFeedResult) -> Void)
}
