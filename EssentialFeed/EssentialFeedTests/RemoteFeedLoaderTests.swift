//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Jastin Martínez on 20/11/22.
//

import XCTest

class RemoteFeedLoader {

}

class HTTPClient {
    var requestedURL: URL?
}

final class RemoteFeedLoaderTests: XCTestCase {

    func test_init() {
        let client = HTTPClient()
        let sut = RemoteFeedLoader()
        XCTAssertNil(client.requestedURL)
    }
}
