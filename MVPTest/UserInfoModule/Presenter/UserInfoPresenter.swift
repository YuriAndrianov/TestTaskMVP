//
//  UserInfoPresenter.swift
//  MVPTest
//
//  Created by MacBook on 19.01.2022.
//

import Foundation

protocol UserInfoViewProtocol: AnyObject {

    func setUser(user: User?)

}

protocol UserInfoViewPresenterProtocol: AnyObject {

    init(view: UserInfoViewProtocol, router: RouterProtocol, user: User?)

    func setUser()

}

class UserInfoPresenter: UserInfoViewPresenterProtocol {

    weak var view: UserInfoViewProtocol?
    var user: User?
    var router: RouterProtocol!

    required init(view: UserInfoViewProtocol, router: RouterProtocol, user: User?) {
        self.view = view
        self.router = router
        self.user = user
    }

    func setUser() {
        view?.setUser(user: user)
    }

}
