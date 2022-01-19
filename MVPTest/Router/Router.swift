//
//  Router.swift
//  MVPTest
//
//  Created by MacBook on 16.01.2022.
//

import UIKit

protocol RouterMain {

    var navigationController: UINavigationController? { get set}
    var assemblyBuilder: AssemblyBuilderProtocol? { get set  }
}

protocol RouterProtocol: RouterMain {

    func showAuth()
    func showSignUp()
    func showMain()
    func showDetail(comment: Comment?)
    func showUserInfo(user: User?)
    func popToRoot()

}

class Router: RouterProtocol {

    var navigationController: UINavigationController?
    var assemblyBuilder: AssemblyBuilderProtocol?

    init(navigationController: UINavigationController, assemblyBuilder: AssemblyBuilderProtocol) {
        self.navigationController = navigationController
        self.assemblyBuilder = assemblyBuilder
    }

    func showAuth() {
        if let navigationController = navigationController {
            guard let authVC = assemblyBuilder?.createAuthModule(router: self) else { return }
            navigationController.viewControllers = [authVC]
        }
    }

    func showSignUp() {
        if let navigationController = navigationController {
            guard let signUpVC = assemblyBuilder?.createSignUpModule(router: self) else { return }
            navigationController.pushViewController(signUpVC, animated: true)
        }
    }

    func showMain() {
        if let navigationController = navigationController {
            guard let mainVC = assemblyBuilder?.createMainModule(router: self) else { return }
            navigationController.pushViewController(mainVC, animated: true)
        }
    }
 
    func showDetail(comment: Comment?) { 
        if let navigationController = navigationController {
            guard let detailVC = assemblyBuilder?.createDetailModule(comment: comment, router: self) else { return }
            navigationController.pushViewController(detailVC, animated: true)
        }
    }

    func showUserInfo(user: User?) {
        if let navigationController = navigationController {
            guard let showUserInfoVC = assemblyBuilder?.createUserInfoModule(user: user, router: self) else { return }
            navigationController.pushViewController(showUserInfoVC, animated: true)
        }
    }

    func popToRoot() {
        if let navigationController = navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }

}
