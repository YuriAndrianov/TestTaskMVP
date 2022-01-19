//
//  AssemblyModuleBuilder.swift
//  MVPTest
//
//  Created by MacBook on 13.01.2022.
//

import Foundation
import UIKit

protocol AssemblyBuilderProtocol {

    func createAuthModule(router: RouterProtocol) -> UIViewController

    func createSignUpModule(router: RouterProtocol) -> UIViewController

    func createMainModule(router: RouterProtocol) -> UIViewController

    func createDetailModule(comment: Comment?, router: RouterProtocol) -> UIViewController

    func createUserInfoModule(user: User?, router: RouterProtocol) -> UIViewController

}

class AssemblyModuleBuilder: AssemblyBuilderProtocol {

    func createAuthModule(router: RouterProtocol) -> UIViewController {
        let view = AuthViewController()
        let presenter = AuthPresenter(view: view, router: router)
        view.presenter = presenter

        return view
    }

    func createSignUpModule(router: RouterProtocol) -> UIViewController {
        let view = SignUpViewController()
        let presenter = SignUpPresenter(view: view, router: router)
        view.presenter = presenter

        return view
    }

    func createMainModule(router: RouterProtocol) -> UIViewController {
        let view = MainViewController()
        let networkService = NetworkService()
        let presenter = MainPresenter(view: view, service: networkService, router: router)
        view.presenter = presenter 

        return view 
    }

    func createDetailModule(comment: Comment?, router: RouterProtocol) -> UIViewController {
        let view = DetailViewController()
        let presenter = DetailPresenter(view: view, router: router, comment: comment)
        view.presenter = presenter

        return view
    }

    func createUserInfoModule(user: User?, router: RouterProtocol) -> UIViewController {
        let view = UserInfoViewController()
        let presenter = UserInfoPresenter(view: view, router: router, user: user)
        view.presenter = presenter

        return view
    }

} 
