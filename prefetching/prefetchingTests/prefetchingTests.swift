//
//  prefetchingTests.swift
//  prefetchingTests
//
//  Created by Jastin Martínez on 5/11/22.
//

import XCTest
@testable import prefetching

final class prefetchingTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }


    func testImageDataSourceGetData() {
        let waitForNet = XCTestExpectation(description: "wait for networkcall")
        let demo = ImageDataSource()
        var data: Data? = nil
        demo.getImage(from: "https://robohash.org/1.png") { de in
            switch de {
            case .success(let success):
                data = success
                waitForNet.fulfill()
            case .failure:
                waitForNet.fulfill()
            }
        }
        wait(for: [waitForNet], timeout: 3)
        XCTAssertNotNil(data)
    }

    func testImageDataSourceGetMultipleDataData() {
        let waitForNet = XCTestExpectation(description: "wait for networkcall")
        let demo = ImageDataSource()
        let max = 200
        var datas: [Data] = []
        for index in 1...max {
            demo.getImage(from: "https://robohash.org/\(index).png") { de in
                switch de {
                case .success(let success):
                    datas.append(success)
                    if datas.count == max {
                        waitForNet.fulfill()
                    }
                case .failure:
                    XCTFail("invalid image \(index)")
                    waitForNet.fulfill()
                }
            }
        }
        wait(for: [waitForNet], timeout: 10)
        XCTAssertTrue(datas.count == max)
    }
}
