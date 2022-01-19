//
//  SignUpPresenter.swift
//  MVPTest
//
//  Created by MacBook on 19.01.2022.
//

import Foundation

protocol SignUpViewProtocol: AnyObject {

    func nameFormatApproved()
    func nameFormatError()
    func ageError()
    func ageApproved()
    func phoneFormatError()
    func phoneFormatApproved()
    func emailFormatError()
    func emailFormatApproved()
    func passwordFormatError()
    func passwordFormatApproved()

}

protocol SignUpViewPresenterProtocol: AnyObject {

    init(view: SignUpViewProtocol, router: RouterProtocol)

    func nameEntered()
    func dayOfBirthChosen()
    func phoneEntered()
    func emailEntered()
    func passwordEntered()
    func signUpTapped()

}

class SignUpPresenter: SignUpViewPresenterProtocol {

    weak var view: SignUpViewProtocol?
    var router: RouterProtocol?

    required init(view: SignUpViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
    }

    func nameEntered() {

    }

    func dayOfBirthChosen() {

    }

    func phoneEntered() {

    }

    func emailEntered() {

    }

    func passwordEntered() {

    }

    func signUpTapped() {

    }

}
