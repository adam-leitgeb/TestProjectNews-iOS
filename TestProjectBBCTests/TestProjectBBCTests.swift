//
//  TestProjectBBCTests.swift
//  TestProjectBBCTests
//
//  Created by Adam Leitgeb on 04/02/2019.
//  Copyright © 2019 Adam Leitgeb. All rights reserved.
//

import XCTest
@testable import TestProjectBBC

class TestProjectBBCTests: XCTestCase {

    // MARK: - Properties

    private var appCoordinator: AppCoordinator {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate, let appCoordinator = appDelegate.appCoordinator else {
            XCTFail("Unable to reach appCoordinator")
            fatalError("Unable to reach appCoordinator")
        }
        return appCoordinator
    }

    // MARK: - Tests

    func testFetchingNews() {
        let expectationForRequest = expectation(description: "Request succseed")

        let notesListService: NewsFeedService = appCoordinator.serviceHolder.get()
        notesListService.fetchNewsFeed { result in
            switch result {
            case .success:
                expectationForRequest.fulfill()
            case .error(let error):
                XCTFail(error.localizedDescription)
            }
        }

        waitForExpectations(timeout: 30.0) { _ -> Void in
        }
    }
}
