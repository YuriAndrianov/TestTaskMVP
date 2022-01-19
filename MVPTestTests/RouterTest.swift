//
//  RouterTest.swift
//  MVPTestTests
//
//  Created by MacBook on 18.01.2022.
//

import XCTest
@testable import MVPTest

class MockNavigationController: UINavigationController {

    var presentedVC: UIViewController?

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        self.presentedVC = viewController
        super.pushViewController(viewController, animated: true)
    }

}

class RouterTest: XCTestCase {

    var router: RouterProtocol!
    var navigationController = MockNavigationController()
    let assembly = AssemblyModuleBuilder()

    override func setUpWithError() throws {
        router = Router(navigationController: navigationController, assemblyBuilder: assembly)
    }

    override func tearDownWithError() throws {
        router = nil
    }

    func testRouter() {
        router.showDetail(comment: nil)
        let detailVC = navigationController.presentedVC

        XCTAssertTrue(detailVC is DetailViewController )
    }

}
