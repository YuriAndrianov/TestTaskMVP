//
//  MainPresenterTests.swift
//  MVPTestTests
//
//  Created by MacBook on 13.01.2022.
//

import XCTest
@testable import MVPTest

class MockView: MainViewProtocol {

    func success() {

    }

    func failure(error: Error) {

    }

}

class MockNetworkService: ServiceProtocol {

    var comments: [Comment]!

    init(comments: [Comment]?) {
        self.comments = comments
    }

    func getComments(completion: @escaping ((Result<[Comment]?, Error>) -> Void)) {
        if let comments = comments {
            completion(.success(comments ))
        } else {
            let error = NSError(domain: "", code: 0, userInfo: nil)
            completion(.failure(error ))
        }
    }

}

class MainPresenterTests: XCTestCase {

    var view: MockView!
    var presenter: MainPresenter!
    var networkService: ServiceProtocol!
    var router: RouterProtocol!
    var comments = [Comment]()

    override func setUpWithError() throws {
        let nav = UINavigationController()
        let assemblyBuilder = AssemblyModuleBuilder()
        router = Router(navigationController: nav, assemblyBuilder: assemblyBuilder)
    }

    override func tearDownWithError() throws {
        view = nil
        networkService = nil
        presenter = nil
    }

    func testGetSuccessComments() {
        let comment = Comment(postId: 1, id: 2, name: "Foo", email: "Bar", body: "Baz")
        comments.append(comment)

        view = MockView()
        networkService = MockNetworkService(comments: comments)
        presenter = MainPresenter(view: view, service: networkService, router: router)

        var catchComments: [Comment]?

        networkService.getComments { result in
            switch result {
            case .success(let comments):
                catchComments = comments
            case .failure(let error):
                print(error.localizedDescription)
            }
        }

        XCTAssertNotEqual(catchComments?.count, 0)

    }

}
