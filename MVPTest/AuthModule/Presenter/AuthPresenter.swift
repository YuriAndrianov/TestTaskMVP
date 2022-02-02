//
//  AuthPresenter.swift
//  MVPTest
//
//  Created by MacBook on 19.01.2022.
//

import Foundation

protocol AuthViewProtocol: AnyObject {

    func success()
    func failure()

}

protocol AuthViewPresenterProtocol: AnyObject {

    init(view: AuthViewProtocol, router: RouterProtocol)

    func didEnteredEmail()
    func didEnteredPassword()
    func didTapSignIn()
    func didTapSignUp()

}

class AuthPresenter: AuthViewPresenterProtocol {

    weak var view: AuthViewProtocol?
    var router: RouterProtocol?

    required init(view: AuthViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
    }

    func didEnteredEmail() {

    }

    func didEnteredPassword() {

    }

    func didTapSignIn() {

    }

    func didTapSignUp() {
        router?.showSignUp()
    }




}
